require 'spec_helper'

describe MediaAssetsController do

  describe 'show' do
    it 'should find media_asset with given param'
  end
  
  describe 'create' do
    describe 'if media_asset failed to upload' do
      it 'should attempt to upload media asset'
      it 'should flash an error'
      it 'media asset should be nil'
    end
    describe 'if media_asset uploads successfully' do
      it 'should upload the media asset'
      it 'should flash success notice'
      it 'should have media asset not be nil'
    end
  end

  describe 'edit' do
  end
  describe 'update' do
  end
  describe 'delete' do
  end
  
end
