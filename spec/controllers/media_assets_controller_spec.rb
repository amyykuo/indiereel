require 'spec_helper'

describe MediaAssetsController do
  
  before :each do
    @current_user = login_as("Kunal")
  end
  
  describe 'show' do
    it 'should find media_asset with given param' do
      MediaAsset.should_receive(:find).with("10").and_return(mock("Asset"))
      get :show, :identifier => "kunal", :role => "talent", :media_collection => "lol", :media_asset => "10"
      response.should render_template("show")
    end
  end
  
  describe 'create' do
    
    before :each do
      role = mock("Role", :role_type => "talent", :user => @current_user)
      MediaCollection.stub!(:find).with("1").and_return(@album = mock("Album", :role => role, :slug => "lol"))
    end 
     
    it "should set a flash error and redirect to the media_collection if the create failed" do
      MediaAsset.should_receive(:create).and_return(nil)
      post :create, :media_asset => {:description => "some shit", :media_collection_id => "1"}
      flash[:error].should == "There was an error in uploading your media."
      response.should redirect_to custom_mc_path("kunal", "talent", "lol")
    end
    
    it "should set a flash notice and redirect to the media_collection if the create succeeded" do
      MediaAsset.should_receive(:create).and_return(mock("Asset"))
      post :create, :media_asset => {:description => "some shit", :media_collection_id => "1"}
      flash[:notice].should == "Media successfully uploaded."
      response.should redirect_to custom_mc_path("kunal", "talent", "lol")
    end
  end

  describe 'destroy' do
  
    it "should destroy the media asset and redirect to the media collection" do
      role = mock("Role", :role_type => "talent", :user => @current_user)
      album = mock("Album", :role => role, :slug => "lol")
      MediaAsset.should_receive(:find).with("1").and_return(@asset = mock("Asset", :media_collection => album))
      @asset.should_receive(:destroy)
      @asset.should_receive(:previous)
      delete :destroy, :id => "1"
      flash[:notice].should == "Media deleted."
      response.should redirect_to custom_mc_path("kunal", "talent", "lol")
    end
  end
  
end
