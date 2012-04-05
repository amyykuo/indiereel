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
  
  # TODO Update new
  describe 'new' do
    
    it 'should render a 404 if user does not exist' do
      User.should_receive(:find_by_identifier).with("dude").and_return(nil)
      Role.should_receive(:options).and_return(["talent"])
      get :new, {:identifier => "dude"}
      response.response_code.should == 404
    end
    
    it 'should set @user and @options' do
      User.should_receive(:find_by_identifier).with("dude").and_return(user = mock("User"))
      Role.should_receive(:options).and_return(["talent"])
      get :new, {:identifier => "dude"}
      response.should render_template("new")
    end
  end
  
  # TODO Update create
  describe 'create new role' do
    
    before :each do
      Role.stub!(:options).and_return(["talent"])
    end
    
    describe 'if role_type (aka name) is one of the options' do
      
      describe 'if role is invalid' do
        it 'should redirect to home_route of current user' do
          Role.should_receive(:create).and_return(mock("Role", :valid? => false, :user => @current_user, :role_type => "talent"))
          post :create, {:role_type => "talent"}
          response.should redirect_to home_path(@current_user.identifier)
        end
      end
      
      describe 'if role is valid' do
        it 'should redirect to the role_route of the newly created role' do
          Role.should_receive(:create).and_return(mock("Role", :valid? => true, :user => @current_user, :role_type => "talent"))
          post :create, {:role_type => "talent"}
          response.should redirect_to role_path(@current_user.identifier, "talent")
        end
      end
    end
    
    describe 'if role_type (aka name) is not one of the options' do
      it 'should have a flash error _You cannot create that role type_ and redirects to home_route of that user' do
        post :create, {:role_type => "dancer"}
        flash[:error].should == "You cannot create that role type."
        response.should redirect_to home_path(@current_user.identifier)
      end
    end
  end

  # TODO Update edit
  describe 'edit role' do
    # We are not testing this yet... We need to figure out how we are going to edit the role first
  end
  
  # TODO Update destroy
  describe 'destroy' do
    
    describe 'if you are the user of the role profile' do
      it 'should delete the role by calling the Role model method destroy' do
        Role.should_receive(:find).and_return(@role = mock("Role", :user => @current_user, :destroy => nil))
        @role.should_receive(:destroy)
        post :destroy, {:id => 1}
      end
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
