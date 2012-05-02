require 'spec_helper'

describe RolesController do
  
  before :each do
    @current_user = login_as("Kunal")
  end
  
  describe 'show' do
    before :each do
      @user = mock("User", :id => 1)
      @role = mock("Role")
    end
    describe 'if @role is nil' do
      it 'should render public/404' do
        User.should_receive(:find_by_identifier).with("dude").and_return(@user)
        Role.should_receive(:find_by_role_type_and_user_id).with("dancer", 1).and_return(nil)
        get :show, {:identifier => "dude", :role => "dancer"}
        response.response_code.should == 404
      end
    end
    describe 'if @role is not nil' do
      it 'should render show' do
        User.should_receive(:find_by_identifier).with("dude").and_return(@user)
        Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(@role)
        @role.should_receive(:headshots)
        @role.should_receive(:portfolio_album)
        get :show, {:identifier => "dude", :role => "talent"}
        response.should render_template("show")
      end
    end
  end
  
  describe 'new' do
      
    it 'should find the current user and get the list of valid ages' do
      User.should_receive(:find_by_uid)
      Role.should_receive(:ages).and_return(["0-7"])
      @current_user.should_receive(:remaining_role_options).and_return(["talent", "crew"])
      get :new
      assigns(:options).should == [["Talent", "talent"],["Crew", "crew"]]
    end
    
    
  end
  
  describe 'create' do
    
    before :each do
      @role = mock("Role", :role_type => "lol", :user => @current_user, :media_collections => [])
    end
    
    describe 'if role already exists for current user' do
      it 'should flash an error and redirect to home page of current_user' do
        Role.should_receive(:where).and_return(mock("Roles", :exists? => "true"))
        post :create, {:role => {:role_type => "lol"}}
        flash[:error].should == "You already have a Lol role."
        response.should redirect_to home_path(@current_user.identifier)
      end
    end
    
    describe 'the new role is not valid' do
      it 'should create the role, check validity, and then redirect to the create role page' do
        Role.should_receive(:create).with({"role_type" => "lol"}).and_return(@role)
        @role.should_receive(:invalid?).and_return(true)
        post :create, {:role => {:role_type => "lol"}}
        response.should redirect_to new_role_path()
      end
    end
    
    describe 'the new role is valid' do 
      it 'should create the role, test its validity, add quickshow and headshot media collections and save' do
        Role.should_receive(:create).with({"role_type" => "lol"}).and_return(@role)
        @role.should_receive(:invalid?).and_return(false)
        MediaCollection.should_receive(:create_quickshow)
        MediaCollection.should_receive(:create_headshot)
        @role.should_receive(:save)
        post :create, {:role => {:role_type => "lol"}}
        flash[:notice].should == "Role created successfully."
        response.should redirect_to custom_role_path("kunal", "lol")
      end
      

      
    end
    

  end

  describe 'edit' do
    
    it 'should 404 if given an invalid user' do
      User.should_receive(:find_by_identifier).with("lol").and_return(nil)
      get :edit, :identifier => "lol", :role => "talent"
      response.response_code.should == 404
    end
    
    it 'should 404 if :identifier is not that of the current user' do
      User.should_receive(:find_by_identifier).with("lol").and_return(mock("User", :id => 9001))
      get :edit, :identifier => "lol", :role => "talent"
      response.response_code.should == 404
    end
    
    it 'should 404 if user does not have the given role' do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(nil)
      get :edit, :identifier => "kunal", :role => "talent"
      response.response_code.should == 404
    end
    
    it 'should get the possible age options for a valid user and role' do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(mock("Role"))
      Role.should_receive(:ages)
      get :edit, :identifier => "kunal", :role => "talent"
    end
  end
  
  describe 'update' do
    
    before :each do
      Role.stub!(:find).with("1").and_return(@role = mock("Role", :id => 1, :role_type => "talent", :user => @current_user, :valid? => false, :invalid? => true))
      @role.stub!(:update_attributes).and_return(nil)
    end
    
    describe 'if role is valid' do
      it 'should update role' do
        @role.should_receive(:valid?).and_return(true)
        post :update, :id => "1", :role => {:id => 1, :role_type => "talent", :user => @current_user}
        flash[:notice].should == "Talent was successfully updated."
        response.should redirect_to custom_role_path("kunal", "talent")
        
      end
    end
    
    describe 'if role is not valid' do
      it 'should not update role' do
        @role.should_receive(:valid?).and_return(false)
        post :update, :id => "1", :role => {:id => 1, :role_type => "talent", :user => @current_user}
        flash[:error].should == "There were some errors in updating your role."
        response.should redirect_to custom_edit_role_path("kunal", "talent")
      end      
    end
  end
  
  describe 'destroy' do
    
    before :each do
      Role.stub!(:find).and_return(@role = mock("Role", :user => @current_user, :destroy => nil, :user => @current_user))
    end
    
    it 'should find the role by ID' do
      Role.should_receive(:find).with("1")
      post :destroy, {:id => 1}
    end
    
    it 'should destroy the role if the user matches the current user' do
      @role.should_receive(:destroy)
      post :destroy, {:id => 1}
    end
    
    it 'should set a flash error if the user does not match the current user' do
      @role.should_receive(:user).and_return(mock("User", :identifier => "lawl"))
      post :destroy, {:id => 1}
      flash[:error].should == "You cannot delete this role."
    end
      
    it 'should redirect to the home route of the current user' do
      Role.should_receive(:find).and_return(@role = mock("Role", :user => @current_user, :destroy => nil))
      post :destroy, {:id => 1}
      response.should redirect_to home_path(@current_user.identifier)
    end
  end
  
end
