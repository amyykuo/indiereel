Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '251723121586225', 'cd33b4dce5845761c96e4e620e522786'
end