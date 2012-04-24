require 'spec_helper'

describe MediaCollectionsController do
  
  before :each do
    @current_user = login_as("Kunal")
  end
  
  describe 'show' do
    # all of these should set variables @user, @role, @album and @media_asset
    describe 'if role is nil' do
      it 'should render public/404'
    end
    describe 'if role is not nil' do
      it 'should render show'
    end
    describe 'if album is nil' do
      it 'should render public/404'
    end
    describe 'if album is not nil' do
      it 'should render show'
    end
  end
  
  describe 'index' do
    describe 'if role is nil' do
      it 'should set @user, @role'
      it 'should bring up 404 page'
    end
    describe 'if role is not nil' do
      it 'should set @user, @role and @albums'
      it 'should sort albums in this order: quickshow, headshot, and most recently updated'
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
    describe 'updated mediacollection is valid' do
      it 'should find role and update valid mediacollection'
      it 'should flash success message and render to updated mediacollection page'
    end
    describe 'updated mediacollection is invalid' do
      it 'should find role and not update invalid mediacollection'
      it 'should flash error message and redirect to mediacollection edit page'
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
