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
        get :show, {:identifier => "dude", :role => "talent"}
        response.should render_template("show")
      end
    end
  end
  
  describe 'new' do
    
    before :each do
      User.stub!(:find_by_identifier).with("kunal").and_return(mock("User", :id => 1))
      Role.stub!(:ages).and_return(["0-7"])
      Role.stub!(:options).and_return(["talent", "crew"])
    end
    
    it 'should find the current user and get the list of valid ages' do
      User.should_receive(:find_by_identifier)
      Role.should_receive(:ages)
      get :new
    end
    
    it 'should check to see if user has each option' do
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(nil)
      Role.should_receive(:find_by_role_type_and_user_id).with("crew", 1).and_return(mock("Role"))
      get :new
      assigns(:options).should == ["talent"]
    end
  end
  
  describe 'create' do
    
    before :each do
      @role = mock("Role", :role_type => "lol", :user => @current_user, :media_collections => [])
    end
    
    describe 'the new role is valid' do 
      it 'should create the role and test its validity' do
        Role.should_receive(:create).with({"role_type" => "lol"}).and_return(@role)
        @role.should_receive(:valid?).and_return(true)
        MediaCollection.should_receive(:create_default).and_return(mock("MediaCollection"))
        @role.should_receive(:save)
        post :create, {:role => {:role_type => "lol"}}
        response.should redirect_to custom_role_path("kunal", "lol")
      end
    end
    
    describe 'the new role is not valid' do
      it 'should create the role, check validity, and then redirect to the home page' do
        Role.should_receive(:create).with({"role_type" => "lol"}).and_return(@role)
        @role.should_receive(:valid?).and_return(false)
        post :create, {:role => {:role_type => "lol"}}
        response.should redirect_to home_path("kunal")
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
    
    it 'should update the attributes' do
      @role.should_receive(:update_attributes)
      post :update, :id => 1, :role => {}
    end
    
    it 'should set a flash error if the resultant role is invalid' do
      post :update, :id => 1, :role => {}
      flash[:error].should == "There were some errors in updating your role..."
      flash[:notice].should == nil
    end
    
    it 'should not set a flash error if the resultant role is valid' do
      @role.should_receive(:valid?).and_return(true)
      @role.should_receive(:invalid?).and_return(false)
      post :update, :id => 1, :role => {}
      flash[:error].should == nil
      flash[:notice].should == "talent was successfully updated."
    end
    
    it 'should redirect to the role route' do
      post :update, :id => 1, :role => {}
      response.should redirect_to custom_role_path("kunal", "talent")
    end
  end
  
  describe 'destroy' do
    
    describe 'if you are the user of the role profile' do
      it 'should delete the role by calling the Role model method destroy' do
        Role.should_receive(:find).and_return(@role = mock("Role", :user => @current_user, :destroy => nil))
        @role.should_receive(:destroy)
        post :destroy, {:id => 1}
      end
      # TODO i don't know if this belongs here... but we need to check if it does this
      it 'should delete all MediaCollections associated with that role'
    end
    
    describe 'if you are not the user of the role profile' do
      it 'should flash error _You cannot delete this role._' do
        Role.should_receive(:find).and_return(@role = mock("Role", :user => mock("User", :identifier => "homie"), :destroy => nil))
        @role.should_not_receive(:destroy)
        post :destroy, {:id => 1}
        flash[:error].should == "You cannot delete this role."
      end
    end
    
    it 'should redirect to the home route of the current user' do
      Role.should_receive(:find).and_return(@role = mock("Role", :user => @current_user, :destroy => nil))
      post :destroy, {:id => 1}
      response.should redirect_to home_path(@current_user.identifier)
    end
  end
  
end
