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
    
    # TODO - fill in the rest of the shit
    it 'should fail to create a user if any other fields are left as nil' do
      # name
      no_name = duplicate(params)["info"]
      no_name["info"].delete("name")
      User.create_with_omniauth(no_name).should == nil 
    end
    
    it 'should fail to create a user if uid is not unique' do
      User.create_with_omniauth(params).should_not == nil
      
      newish_params = duplicate(params)
      newish_params["info"]["nickname"] = "somethingelse"
      
      User.create_with_omniauth(newish_params).should == nil
    end
    
    it 'should fail to create a user if username is not unique' do
      User.create_with_omniauth(params).should_not == nil
      
      newish_params = duplicate(params)
      newish_params["uid"] = "somethingelse"
      
      User.create_with_omniauth(newish_params).should == nil
    end
  end
  
  # These will be basically the same as the above
  describe 'updating a user' do
  end
  
  describe 'identifiers' do
    it 'should return the username as an identifier if it has one, or the uid otherwise' do
      @kunal = User.create_with_omniauth(params)
      @kunal.identifier.should == "kbreezy"
      @kunal.username = nil
      @kunal.save
      @kunal.identifier.should == "1234"
    end
  end
  
end
