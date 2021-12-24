# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# For testing locally
# Rails.application.routes.default_url_options[:host] = 'localhost:4000'

# After deployment
Rails.application.routes.default_url_options[:host] = 'https://house-booking-api.herokuapp.com'
