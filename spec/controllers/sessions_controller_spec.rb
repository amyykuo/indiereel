require 'spec_helper'

describe SessionsController do
    
  # Testing the create action
  describe 'create user with omniauth or find registered user' do
    
    # Set the request environment variable, and define a mock user
    before :each do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      @kunal = mock('Kunal', :uid => "1234", :name => "Kunal", :update_with_omniauth => "lol")
    end
    
    # The common functionality of the create method
    shared_examples_for "the rest of the method" do
      it 'should update the user with the latest information from Facebook' do
        @kunal.should_receive(:update_with_omniauth)
        post :create
      end

      it 'should set uid in the session to that of the just-logged-in user' do
        post :create
        session[:user_id].should == "1234"
      end

      it 'should redirect to the index URL' do
        post :create
        response.should redirect_to root_url
      end
    end
    
    # If a user already exists
    describe 'user exists' do
      
      before :each do
        User.stub!(:find_by_uid).with("1234").and_return(@kunal)
      end
      
      it 'should find the user using the Facebook authentication info' do
        User.should_receive(:find_by_uid).with("1234").and_return(@kunal)
        post :create
      end
      
      it_behaves_like "the rest of the method"
      
    end
    
    # If a user does not exist
    describe "user doesn't exist" do
      
      before :each do
        User.stub!(:create_with_omniauth).and_return(@kunal)
      end
      
      it 'should create the user using the create_with_omniauth model method' do
        User.should_receive(:create_with_omniauth).and_return(@kunal)
        post :create
      end
      
      it_behaves_like "the rest of the method"
      
    end
  end
  
  
  # Testing the destroy action
  describe 'logging out a user' do
    
    it 'should set the session to nil' do
      session[:user_id] = "1234"
      post :destroy
      session[:user_id].should == nil
    end
  
    it 'should redirect user to the welcome page' do
      post :destroy
      response.should redirect_to root_url
    end
  end
  
end
