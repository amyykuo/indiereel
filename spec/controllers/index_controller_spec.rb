require 'spec_helper'

describe IndexController do
  
  describe 'index' do
    
    it "should redirect to user's home page if they're logged in." do
      @current_user = login_as("Kunal")
      get :index
      response.should redirect_to home_path("kunal")
    end
    
    it "should render welcome if user is not logged in" do
      get :index
      response.should render_template "index"
    end
  end

end
