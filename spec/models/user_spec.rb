require 'spec_helper'

describe User do

  describe 'creating a user' do
    
    params = {"uid" => "1234", 
      "info" => {"nickname" => "kbreezy", "name" => "Kunal Mehta", "first_name" => "Kunal", "last_name" => "Mehta", "email" => "kunal@lol.com", "image" => "http://lol.com/kunal.png"}, 
      "extra" => {"raw_info" => {"timezone" => -7, "gender" => "male"}},
      "credentials" => {"token" => "hi_i'm_a_token_lol_sup"}}
    
    def duplicate(params)
      Marshal.load(Marshal.dump(params))
    end
    
    it 'should successfully create a user given acceptable parameters' do
      @kunal = User.create_with_omniauth(params)
      @kunal.should_not == nil
      @kunal.uid.should == "1234"
      @kunal.username.should == "kbreezy"
      @kunal.name.should == "Kunal Mehta"
      @kunal.first_name.should == "Kunal"
      @kunal.last_name.should == "Mehta"
      @kunal.email.should == "kunal@lol.com"
      @kunal.image.should == "http://lol.com/kunal.png"
      @kunal.gender.should == "male"
      @kunal.timezone.should == -7
      @kunal.access_token.should == "hi_i'm_a_token_lol_sup"
    end
    
    it 'should default to nil for usernames, access tokens, and images that are not provided' do
      incomplete_params = duplicate(params)
      incomplete_params["info"].delete("nickname")
      incomplete_params.delete("credentials")
      incomplete_params["info"].delete("image")
      
      @kunal = User.create_with_omniauth(incomplete_params)
      @kunal.should_not == nil
      @kunal.username.should == nil
      @kunal.image.should == nil
      @kunal.access_token.should == nil
    end
    
    # TODO
    it 'should fail to create a user if any other fields are left as nil'
    
    # TODO
    it 'should fail to create a user if uid is not unique'
    
    # TODO
    it 'should fail to create a user if username is not unique'
    
    it 'should return the username as an identifier if it has one, or the uid otherwise' do
      @kunal = User.create_with_omniauth(params)
      @kunal.identifier.should == "kbreezy"
      @kunal.username = nil
      @kunal.save
      @kunal.identifier.should == "1234"
    end
    
  end
  
  describe 'updating a user' do
  end
  
end
