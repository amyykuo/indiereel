require 'spec_helper'

describe RolesController do
  describe 'show' do
    #it 'should set @user and @role'
=begin    
    before :each do
      @user = mock("User", :id => 1)
      @role = mock("Role")
      #User.stub!(:find_by_identifier).with("dude").and_return(@user = mock("User", :id => 1))
      #Role.stub!(:find_by_role_type_and_user_id).with("talent", 1).and_return(@role = mock("Role"))
    end
    
    describe 'if @role is nil' do
      it 'should render public/404' do
        User.should_receive(:find_by_identifier).with("dude").and_return(@user)
        Role.should_receive(:find_by_role_type_and_user_id).with("dancer", 1).and_return(nil)
        get :show, {:identifier => "dude", :role => "dancer"}
        #response.should render_template('public/404')
      end
    end
    describe 'if @role is not nil' do
      it 'should render show' do
        User.should_receive(:find_by_identifier).with("dude").and_return(@user)
        Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(@role)
        get :show, {:identifier => "dude", :role => "dancer"}
        #response.should render_template("show")
      end
    end
=end
  end
  
  describe 'new' do
=begin
    it 'should set @user and @options' do
      User.stub!(:find_by_identifier).with("dude").and_return(user = mock("User"))
      
      assigns(:user).should eq(user)
      assigns(:options).should eq(Role.options)
      get :new
    end
=end
  end
  
  describe 'create new role' do
    it 'should set name to the parameter role_type'
    describe 'if role_type (aka name) is one of the options' do
      it 'should create role'
      describe 'if role is nil' do
        it 'should redirect to home_route of current user'
      end
      describe 'if role is not nil' do
        it 'should redirect to the role_route of the newly created role'
      end
    end
    describe 'if role_type (aka name) is not one of the options' do
      it 'should have a flash error _You cannot create that role type_ and redirects to home_route of that user'
    end
  end
  
  describe 'edit role' do
    # We are not testing this yet... We need to figure out how we are going to edit the role first
  end
  
  describe 'destroy' do
    it 'should set role'
    'after each one, it should redirect to home_route of current_user'
    describe 'if you are the user of the role profile' do
      it 'should delete the role by calling the Role model method destroy'
    end
    describe 'if you are not the user of the role profile' do
      it 'should flash error _You cannot delete this role._'
    end
  end
  
end
