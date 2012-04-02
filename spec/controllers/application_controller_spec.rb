require 'spec_helper'

describe ApplicationController do
  # there's some stuff like protect_from_forgery and filter stuff and I don't know how to test those
  
  describe 'getting the current user' do
    describe 'user is registered' do
      it 'should set @authenticated_user to the user signed in' do
        User.stub!(:find_by_uid).with("1234").and_return(@user = mock("User"))
        session[:user_id] = "1234"
        controller.send(:current_user).should == @user
      end
    end
    describe 'user is not registered' do
      it 'should set @authenticated_user to nil' do
        session[:user_id] = nil
        controller.send(:current_user).should == nil
      end
    end
  end
  
  # we're assuming authenticated_user is called in every controller appropiately
  describe 'authenticate user / make sure there is a user is logged in' do
    describe 'current_user is nil' do
      it 'should redirect to the welcome page' do
        session[:user_id] = nil
        controller.send(:authentication_required).should redirect_to root_url
      end
    end
    describe 'current_user is not nil' do
      it 'should do nothing'
      #  session[:user_id] = nil
      #  controller.send(:authentication_required)
      #  response.should redirect_to root_url
        
    end
  end
  
  before :each do
    @user = mock('User', :identifier => 'amy')
    @role = mock('Role', :user => @user, :role_type => 'talent')
  end
  
  describe 'role_route' do
    describe 'no action' do
      it 'should return the role profile uri' do
        controller.send(:role_route, @role).should == "/amy/talent"
      end
    end
    describe 'edit action' do
      it 'should return the edit role profile uri' do
        controller.send(:role_route, @role, "edit").should == "/amy/talent/edit"
      end
    end
  end
  
  describe 'portfolio_route' do
  end
  describe 'projects_route' do
  end
  describe 'home_route' do
  end

end
