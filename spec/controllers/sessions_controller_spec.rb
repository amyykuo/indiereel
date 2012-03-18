require 'spec_helper'

describe SessionsController do
  
  it 'should skip the authentication requirement'
  
  describe 'create user with omniauth or find registered user' do
    it 'should log the user into app through facebook'
    it 'should find or create the user with the info facebook returns'
    it 'should update the user if need be'
    it 'should set the establish the correct user is logged in'
    it 'should redirect to the correct home page'
  end
  
  describe 'logging out a user' do
    it 'should set the session to nil'
    it 'should redirect user to the welcome page'
  end

=begin
# try using shared_examples_for and it_should_behave_like for DRYNESS
describe ProfileController do

  describe 'index' do
  end
  
  describe 'create a role profile' do
  end
  
  describe 'delete' do
  end
  
  describe 'edit' do
  end
=end
  
end