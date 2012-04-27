require 'spec_helper'

describe MediaCollectionsController do
  
  before :each do
    @current_user = login_as("Kunal")
  end
  
  describe 'show' do
    it "should 404 if the role doesn't exist" do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(nil)
      get :show, :identifier => "kunal", :role => "talent", :media_collection => "lols"
      response.response_code.should == 404
    end
    
    it "should 404 if the album doesn't exist" do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(mock("Role", :id => 7))
      MediaCollection.should_receive(:find_by_slug_and_role_id).with("lols", 7).and_return(nil)
      get :show, :identifier => "kunal", :role => "talent", :media_collection => "lols"
      response.response_code.should == 404
    end
    
    it "should render the show page if all components exist" do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(mock("Role", :id => 7))
      MediaCollection.should_receive(:find_by_slug_and_role_id).with("lols", 7).and_return(album = mock("Album"))
      MediaAsset.should_receive(:new).with(:media_collection => album)
      album.should_receive(:media_assets_in_groups_of).with(6)
      get :show, :identifier => "kunal", :role => "talent", :media_collection => "lols"
      response.should render_template("show")
    end
  end
  
  describe 'index' do
    it "should 404 if the role doesn't exist" do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(nil)
      get :index, :identifier => "kunal", :role => "talent"
      response.response_code.should == 404
    end
    
    it "should get and sort the albums and render the index page if the role exists" do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(role = mock("Role"))
      role.should_receive(:media_collections).and_return([mock("Album", :quickshow => false, :headshot => false, :updated_at => 0)])
      get :index, :identifier => "kunal", :role => "talent"
      response.should render_template("index")
    end
  end
  
  describe 'new' do
    it "should 404 if the role doesn't exist" do
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(nil)
      get :new, :role => "talent"
      response.response_code.should == 404
    end
    
    it "should create a new media collection if the role exists." do
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(role = mock(Role))
      MediaCollection.should_receive(:new).with(:role => role)
      get :new, :role => "talent"
      response.should render_template("new")
    end
  end
  
  describe 'create' do
    
    before :each do
      @role = mock("Role", :user => @current_user, :role_type => "talent")
    end
  
    it "should redirect to the media collection index page if the media collection is invalid" do
      MediaCollection.should_receive(:create).with("title" => "lol").and_return(mock("Album", :role => @role, :valid? => false))
      post :create, :media_collection => {:title => "lol"}
      flash[:error].should == "There was an error in creating your album."
      response.should redirect_to new_media_collection_path(:role => "talent")
    end
    
    it "should redirect to the media collection's page if the media collection is valid" do
      MediaCollection.should_receive(:create).with("title" => "lol").and_return(mock("Album", :role => @role, :valid? => true, :slug => "lol"))
      post :create, :media_collection => {:title => "lol"}
      flash[:notice].should == "Album created."
      response.should redirect_to custom_mc_path("kunal", "talent", "lol")
    end
  end
  
  describe 'edit' do
    
    it "should 404 if the role doesn't exist" do
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(nil)
      get :edit, :identifier => "kunal", :role => "talent", :media_collection => "lol"
      response.response_code.should == 404
    end
    
    it "should 404 if the media collection doesn't exist" do
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(mock("Role", :id => 4))
      MediaCollection.should_receive(:find_by_slug_and_role_id).with("lol", 4).and_return(nil)
      get :edit, :identifier => "kunal", :role => "talent", :media_collection => "lol"
      response.response_code.should == 404
    end
    
    it "should render the edit template if role and media collection exist" do
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(mock("Role", :id => 4))
      MediaCollection.should_receive(:find_by_slug_and_role_id).with("lol", 4).and_return(mock("Album"))
      get :edit, :identifier => "kunal", :role => "talent", :media_collection => "lol"
      response.should render_template("edit")
    end
  end
  
  
  describe 'update' do
  
    before :each do
      @role = mock("Talent", :role_type => "talent", :user => @current_user)
    end
    
    it "should redirect to the media collection show page if the album successfully updated" do
      MediaCollection.should_receive(:find).with("4").and_return(mc = mock("Album", :valid? => false, :role => @role, :slug => "lol"))
      mc.should_receive(:update_attributes).with("title" => "lols")
      put :update, :id => "4", :media_collection => {:title => "lols"}
      flash[:error].should == "There was an error in updating your album."
      response.should redirect_to custom_edit_mc_path("kunal", "talent", "lol")
    end
    
    it "should flash error and redirect back to the edit page if the album didn't successfully update" do
      MediaCollection.should_receive(:find).with("4").and_return(mc = mock("Album", :valid? => true, :role => @role, :slug => "lol"))
      mc.should_receive(:update_attributes).with("title" => "lols")
      mc.should_receive(:title).and_return("lols")
      put :update, :id => "4", :media_collection => {:title => "lols"}
      flash[:notice].should == "lols album was successfully updated."
      response.should redirect_to custom_mc_path("kunal", "talent", "lol")
    end
  end
  
  
  describe 'destroy' do
    it "should destroy the media collection and redirect to the current user's portfolio" do
      role = mock("Talent", :role_type => "talent", :user => @current_user)
      MediaCollection.should_receive(:find).with("1").and_return(album = mock("MediaCollection", :role => role))
      album.should_receive(:destroy)
      delete :destroy, :id => "1"
      flash[:notice].should == "Album deleted."
      response.should redirect_to portfolio_path("kunal", "talent")
    end
  end
  
end
