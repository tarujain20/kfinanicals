# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load the app's custom environment variables here,
# so that they are loaded before environments/*.rb
require File.join(Rails.root, 'config', 'env_checker.rb')
# anytime you rely on env variables, add them here.
EnvChecker.new(%W[PLAID_CUSTOMER_ID PLAID_SECRET_KEY]
              ).read!

# Initialize the Rails application.
Rails.application.initialize!
