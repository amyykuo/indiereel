require 'spec_helper'

describe ProjectsController do

  before :each do
    @current_user = login_as("Kunal")
  end
  
  describe "index" do
    it "should 404 if role doesn't exist" do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(nil)
      get :index, :identifier => "kunal", :role => "talent"
      response.response_code.should == 404
    end
    
    it "should render the projects page if role exists" do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      Role.should_receive(:find_by_role_type_and_user_id).with("talent", 1).and_return(role = mock("Talent"))
      get :index, :identifier => "kunal", :role => "talent"
      response.should render_template("index")
    end
  end
end
