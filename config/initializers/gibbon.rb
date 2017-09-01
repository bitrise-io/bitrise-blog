Gibbon::Request.api_endpoint = ENV['MAILCHIMP_API_SERVER']
Gibbon::Request.api_key = ENV['MAILCHIMP_API_TOKEN']
Gibbon::Request.timeout = 15
Gibbon::Request.open_timeout = 15
Gibbon::Request.symbolize_keys = true
Gibbon::Request.debug = false