require 'spec_helper'

describe RolesController do
  describe 'create new role' do
    
    before :each do 
      @fake_role = mock('Role', :name => 'actor')
    end
    
    describe 'a role was selected to be created' do
      it 'should call the model method that creates a new role' do
        Role.stub(:find_by_user_id).and_return(mock('Role', :name => 'director'))
        Role.should_receive(:create).with('actor').and_return(@fake_role)
      end
    end
    
    describe 'a role was selected and created successfuly' do
      before :each do
        Role.stub(:find_by_user_id).and_return(mock('Role', :name => 'director'))
        Role.stub(:create).with('actor').and_return(@fake_role)
        get :edit_role
      end
      
      it 'should select the Edit Role template for rendering' do
        response.should render_template('edit_role')
      end
    end
    
    describe 'a role was selected and but already exists' do
      before :each do
        Role.stub(:find_by_user_id).and_return(mock('Role', :name => 'director'))
        Role.stub(:create).with('director')
      end
      
      it 'should select a role that already exists and return nil because no new role was created' do
        assigns(:create).should == nil
      end
      
      it 'should redirect to the home page' do
        response.should redirect_to home_page
      end     
    end
  end
  
  describe 'edit current role' do
    before :each do
      Role.stub(:find_by_user_id).and_return(mock('Role', :name => 'director'))
    end
    
    
    it 'should call the model method that saves the new information' do
      Role.should_receive(:update)
    end
    
    it 'should produce the flash message saying edit was successful' do
      flash[:notice].should == "'director' updated successfully"
    end
  end
  
  
end
