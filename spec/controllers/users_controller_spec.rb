require 'spec_helper'

describe UsersController do
  
  before :each do
    @current_user = login_as("Kunal")
  end
  
  describe 'show' do
  
    before :each do
      User.stub!(:find_by_identifier).with("evan").and_return(@evan = mock("Evan", :uid => "111", :identifier => "evan"))
    end
    
    it "should 404 if the user has no default role" do
      @evan.should_receive(:default_role).and_return(nil)
      get :show, :identifier => "evan"
      response.response_code.should == 404
    end
    
    it "should redirect to the user's default role page if not the current user" do
      @evan.stub!(:default_role).and_return(mock("Talent", :role_type => "talent", :user => @evan))
      User.should_receive(:find_by_identifier).with("evan").and_return(@evan)
      get :show, :identifier => "evan"
      response.should redirect_to custom_role_path("evan", "talent")
    end
      
    
    it "should work and shit otherwise" do
      User.should_receive(:find_by_identifier).with("kunal").and_return(@current_user)
      @current_user.should_receive(:roles)
      @current_user.should_receive(:roles_in_groups_of).with(2)
      get :show, :identifier => "kunal"
    end
    
  end
  
  describe 'update' do
    
    it "should redirect to the user's home page with a flash error if the new default role is nil" do
      Role.should_receive(:find_by_id_and_user_id).with("1", @current_user.id).and_return(nil)
      put :update, :id => "1", :role_id => "1"
      flash[:error].should == "There was an error in setting your default role."
      response.should redirect_to home_path("kunal")
    end
    
    it "should save the new default role and redirect user's home page" do
      Role.should_receive(:find_by_id_and_user_id).with("1", @current_user.id).and_return(@role = mock("Role", :role_type => "talent"))
      @current_user.should_receive(:default_role=).with(@role)
      @current_user.should_receive(:save)
      put :update, :id => "1", :role_id => "1"
      flash[:notice].should == "Default role successfully updated to Talent."
      response.should redirect_to home_path("kunal")
    end
  end

end
