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
      no_name = duplicate(params)
      no_name["info"].delete("name")
      #User.create_with_omniauth(no_name).should == nil 
      
      no_name_user = User.create_with_omniauth(no_name)#params.merge(:name => nil))
      no_name_user.should_not be_valid
    
    end
    
    it 'should fail to create a user if uid is not unique' do
      User.create_with_omniauth(params).should_not == nil
      
      newish_params = duplicate(params)
      newish_params["info"]["nickname"] = "somethingelse"
      
      same_id_user = User.create_with_omniauth(newish_params)     
      same_id_user.should_not be_valid     
      

    end
    
    it 'should fail to create a user if username is not unique' do
      User.create_with_omniauth(params).should_not == nil
      
      newish_params = duplicate(params)
      newish_params["uid"] = "somethingelse"
      
      same_username_user = User.create_with_omniauth(newish_params)
      same_username_user.should_not be_valid            
    end
  end
  
  # These will be basically the same as the above
  describe 'updating a user' do
    params = {"uid" => "1234", 
      "info" => {"nickname" => "kbreezy", "name" => "Kunal Mehta", "first_name" => "Kunal", "last_name" => "Mehta", "email" => "kunal@lol.com", "image" => "http://lol.com/kunal.png"}, 
      "extra" => {"raw_info" => {"timezone" => -7, "gender" => "male"}},
      "credentials" => {"token" => "hi_i'm_a_token_lol_sup"}}
    
    params2 = {"uid" => "12341", 
      "info" => {"nickname" => "kbreezy1", "name" => "Kunal1 Mehta1", "first_name" => "Kunal1", "last_name" => "Mehta1", "email" => "kunal@lol.com1", "image" => "http://lol.com/kunal.png1"}, 
      "extra" => {"raw_info" => {"timezone" => -71, "gender" => "male1"}},
      "credentials" => {"token" => "hi_i'm_a_token_lol_sup1"}}
    
    it 'should successfully update information if the parameters differ from the time of creation' do
      @user1 = User.create_with_omniauth(params)
      @user1.update_with_omniauth(params2)
      @user1.should_not == nil
      @user1.uid.should == "1234"
      @user1.username.should == "kbreezy1"
      @user1.name.should == "Kunal1 Mehta1"
      @user1.first_name.should == "Kunal1"
      @user1.last_name.should == "Mehta1"
      @user1.email.should == "kunal@lol.com1"
      @user1.image.should == "http://lol.com/kunal.png1"
      @user1.gender.should == "male1"
      @user1.timezone.should == -71
      @user1.access_token.should == "hi_i'm_a_token_lol_sup1"
      
    end
  
  end
end
