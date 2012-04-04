=begin
Before('@omniauth_test') do
  OmniAuth.config.test_mode = true

# the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:facebook] = {
      "provider"=>"facebook",
      #"uid"=>"http://xxxx.com/openid?id=118181138998978630963",
      "uid"=>"12345",
      "user_info"=>{"username"=>"tester", 
                    "name"=>"Test User", 
                    "first_name"=>"Test", 
                    "last_name"=>"User", 
                    "timezone"=>"0",
                    "access_token"=>"token",
                    "email"=>"test@xxxx.com",
                    "gender"=>"neutral",
                    "image"=>"http://hi.com/user.png"
                   }
      
  }
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end
=end
