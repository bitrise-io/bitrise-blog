require 'buttercms-ruby'

ButterCMS::api_token = ENV['BUTTER_TOKEN']

# Test mode can be used to setup a staging website for previewing content or for testing content during local development.
if ENV['RAILS_ENV'] == 'development'
  ButterCMS::test_mode = true
end
