require 'spec_helper'

describe MediaCollectionsController do
  
  describe 'show' do
    # all of these should set variables @user, @role, @album and @media_asset
    describe 'if role is nil' do
      it 'should render public/404'
    end
    describe 'if role is not nil' do
      it 'should render show'
    end
    describe 'if album is nil' do
      it 'should render public/404'
    end
    describe 'if album is not nil' do
      it 'should render show'
    end
  end
  
  describe 'index' do
    describe 'if role is nil' do
      it 'should set @user, @role'
      it 'should bring up 404 page'
    end
    describe 'if role is not nil' do
      it 'should set @user, @role and @albums'
      it 'should sort albums in this order: quickshow, headshot, and most recently updated'
    end
  end
  
  describe 'new' do
    describe 'if role is nil' do
      it 'should not create a new media collection'
      it 'should redirect to portfolio page?'
    end
    describe 'if role is not nil' do
      it 'should create a new media collection'
    end
  end
  
  describe 'create' do
    describe 'mediacollection is valid' do
      it 'should find role and create valid media collection, media collection should have a title'
      it 'should flash success message and redirect to new media collection page'
    end
    describe 'mediacollection is not valid' do
      it 'should find role and not create invalid mediacollection, media collection might not have a title'
      it 'should flash error message and redirect to create mediacollection page'
    end
  end
  
  describe 'edit' do
    describe 'does not find user, role or media collection' do
      it 'should redirect to some page... 404?'
    end
    describe 'finds user, role, and media collection' do
      it 'should find user, role and media collection'
    end
  end
  
  describe 'update' do
    describe 'updated mediacollection is valid' do
      it 'should find role and update valid mediacollection'
      it 'should flash success message and render to updated mediacollection page'
    end
    describe 'updated mediacollection is invalid' do
      it 'should find role and not update invalid mediacollection'
      it 'should flash error message and redirect to mediacollection edit page'
    end
  end
  
  describe 'destroy' do
    # it should delete all uploaded files associated with it? Have not done this yet
    it 'should destroy mediacollection and flash deletion success if user matches current user'
    it 'shoud not destroy mediacollection and flash deletion failure if user does not match current user'
    it 'should redirect to portfolio page'
  end
  
end
