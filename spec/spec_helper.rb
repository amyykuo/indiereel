require 'simplecov'
SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'sunspot/rails/spec_helper'

def login_as(name)
  kunal = mock("Kunal", {:name => name, :uid => "123", :identifier => "kunal", :id => 1})
  User.stub(:find_by_uid).with("123").and_return(kunal)
  session[:user_id] = "123"
  return kunal
end


OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:facebook, {  :provider    => "facebook", 
                                  :uid         => "1234", 
                                  :user_info   => {   :name       => "Kunal Mehta",
                                                      :nickname   => "K-Breezy",
                                                      :urls       => {:Facebook => "www.facebook.com/kbreezy"}},
                                  :credentials => {   :auth_token => "lk2j3lkjasldkjflk3ljsdf"} })

Spec::Runner.configure do |config|
  config.before(:each) do
    ::Sunspot.session = ::Sunspot::Rails::StubSessionProxy.new(::Sunspot.session)
  end

  config.after(:each) do
    ::Sunspot.session = ::Sunspot.session.original_session
  end
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end
