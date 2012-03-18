require 'spec_helper'

describe ApplicationController do
  # there's some stuff like protect_from_forgery and filter stuff and I don't know how to test those
  
  describe 'setting the current user' do
    it 'should set @authenticated_user to the user signed in or nil'
  end
  
  describe 'authenticate user / make sure there is a user logged in' do
    describe 'current_user is nil'
      it 'should redirect to the welcome page'
      
    describe 'current_user is not nil'
      it 'should do nothing'
  end

end
