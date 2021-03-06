require 'spec_helper'

describe ApplicationController do
  
  controller do
    def index
      render :nothing => true
    end
  end
  
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
  
  # We're assuming authenticated_user is called in every controller appropiately
  describe 'authenticate user / make sure there is a user is logged in' do
    describe 'user is not logged in' do
      it 'should redirect to the welcome page' do
        get :index
        response.should redirect_to root_url
      end
    end
    describe 'current_user is not nil' do
      it 'should redirect to the user\'s home page' do
        login_as("Kunal")
        get :index
        response.body.should be_blank
      end   
    end
  end
  
  before :each do
    @user = mock('User', :identifier => 'amy')
    @role = mock('Role', :user => @user, :role_type => 'talent')
    @mc = mock('MediaCollection', :slug => 'pics', :role => @role)
    @media = mock('MediaAsset', :media_collection => @mc, :id => 1)
  end
  
  describe 'role_route' do
    it 'should return the role profile uri' do
      controller.send(:role_route, @role).should == "/amy/talent"
    end
  end
  describe 'edit_role_route' do
    it 'should return the edit role profile uri' do
      controller.send(:edit_role_route, @role).should == "/amy/talent/edit"
    end
  end

  
  describe 'portfolio_route' do
    it 'should return the role portfolio uri' do
      controller.send(:portfolio_route, @role).should == "/amy/talent/portfolio"
    end
  end
      
  describe 'projects_route' do
    it 'should return the role project uri' do
      controller.send(:projects_route, @role).should == "/amy/talent/projects"
    end
  end
  
  describe 'mc_route' do
    it 'should return the media collection uri' do
      controller.send(:mc_route, @mc).should == "/amy/talent/album/pics"
    end
  end
  
  describe 'edit_mc_route' do
    it 'should return the edit media collection uri' do
      controller.send(:edit_mc_route, @mc).should == "/amy/talent/album/pics/edit"      
    end
  end
  
  describe 'media_route' do
    it 'should return the media page uri' do
      controller.send(:media_route, @media).should == "/amy/talent/album/pics/1"    
    end
  end  
  
  describe 'home_route' do
    it 'should return the role project uri' do
      controller.send(:home_route, @user).should == "/amy"
    end
  end

end
