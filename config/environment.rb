# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
    # Your existing configuration options
    # ...
  
    # Add this line to configure your mailer
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
end
  