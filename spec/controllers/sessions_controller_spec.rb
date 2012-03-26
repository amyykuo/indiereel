require 'spec_helper'

describe SessionsController do
  
  it 'should skip the authentication requirement'
  
  describe 'create user with omniauth or find registered user' do
    
    before :each do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      @kunal = mock('Kunal', :uid => "1234", :name => "Kunal", :update_with_omniauth => "lol")
      User.stub!(:find_by_uid).with("1234").and_return(@kunal)
    end
    
    describe 'user exists' do
      it 'should find the user using the Facebook authentication info' do
        User.should_receive(:find_by_uid).with("1234").and_return(@kunal)
        post :create
      end
    end
    
    describe "user doesn't exist" do
      it 'should create the user using the create_with_omniauth model method' do
      end
    end
    
    it 'should update the user with the latest information from Facebook' do
      @kunal.should_receive(:update_with_omniauth)
      post :create
    end
    
    it 'should set the establish the correct user is logged in' do
      post :create
      session[:user_id].should == "1234"
    end
    
    it 'should redirect to the correct home page' do
      post :create
      response.should redirect_to root_url
    end
  end
  
  describe 'logging out a user' do
    it 'should set the session to nil'
    it 'should redirect user to the welcome page'
  end
end
