# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'ishop',
    :password => '',
    :domain => '220ua.com',
    :address => '220ua.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}

