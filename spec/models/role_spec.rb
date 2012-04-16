require 'spec_helper'

describe Role do

  before :each do
    @mock_user = mock('User', :identifier => 'lol', :name => 'lulz0rz', :uid => '123', :username => 'lulz', :id => 1)
    @fake_results = mock('Role', :role_type => 'talent', :role_name => 'lul z0rz')
    
    @current_user = login_as('lul')
  end
  
  describe 'creating a role' do
    params = {}
    
    describe 'it should successfully create a role given good parameters' do
      post :create, {:role_type => 'talent', :role_name => 'lul z0rz'}
      
      Role.should == @fake_results
    end
  end
  
  describe 'updating a role' do
    
    describe 'it should update a role given good parameters' do
      @edited_role = mock('Role', :role_type => 'talent', :role_name => 'asdf')
      
      post :edit, {:role_type => 'talent', :role_type => 'asdf'}
      
      Role.should == @edited_role
    end
    
    describe 'it should NOT update a role with an invalid parameter' do
      post :edit, {:role_type => 'AREIJOERIVJIRJVOWIEf', :role_name => nil}
      
      Role.should == @edited_role
    end
  end
end
