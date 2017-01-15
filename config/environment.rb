# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.options = {
  associate_tag: 'xxx',
  AWS_access_key_id: 'xxx',
  AWS_secret_key: 'xxx'
}
