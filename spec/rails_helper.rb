# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'vcr'
require 'simplecov'
SimpleCov.start

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<yelp_key>') { ENV['yelp_key'] }
  c.filter_sensitive_data('<google_key>') { ENV['google_key'] }
  c.ignore_localhost = true
  c.allow_http_connections_when_no_cassette = true
end

# Add additional requires below this line. Rails is not loaded until this point!
def store_stub
  {:geometry=>
  {:location=>{:lat=>44.045931, :lng=>-123.016249},
   :viewport=>{:northeast=>{:lat=>44.0474006302915, :lng=>-123.0148993197085}, :southwest=>{:lat=>44.0447026697085, :lng=>-123.0175972802915}}},
 :icon=>"https://maps.gstatic.com/mapfiles/place_api/icons/shopping-71.png",
 :id=>"f4050d4b15b5284d4bf31fe4aa62b56e50df9c25",
 :name=>"The Nautilus Tropical Fish",
 :opening_hours=>{:open_now=>true, :weekday_text=>[]},
 :photos=>
  [{:height=>3464,
    :html_attributions=>["<a href=\"https://maps.google.com/maps/contrib/100222379197515106636/photos\">David Kennedy</a>"],
    :photo_reference=>
     "CoQBdwAAANoNT5y4PKwc8wKpKjxyAST4R-lOtXBL7kEf74NrlCCwbUllqoFaG6cj7UcgUmT5LC5-NCLgDaFaUC7MMuv5eo0S4QifUNXdvxdg_ET8p5cJ5A2afnkDWXWEQh1xxSvEPxHK0xj9aLFjp52JofJ3njk2kNIk5INsEK4O5dIfRMUoEhA9B2YU7KD5gkgZPFJjCI-rGhRS1AbnLc9wln8ZjS-b4y-NueXUEQ",
    :width=>4618}],
 :place_id=>"ChIJnYUuEErgwFQR6TmPQnQlIoM",
 :rating=>4.3,
 :reference=>
  "CmRSAAAAQQOQCnC2obS8QHX_TCzJfWpsBjAZFwzzJrw81c_n7wSAxBdWhTDWzU1mQByeZzI0yAFTyldboRiHIkxIvJFqEWcgjlmsh-HjDVYpinHZti3_uY3PrhngHfNUxi8G15cCEhBxZqFBpmPLgdVvN7BTplEzGhSVWbhdxHOLbJHSUDTDicIbCXQ8gQ",
 :scope=>"GOOGLE",
 :types=>["pet_store", "food", "store", "point_of_interest", "establishment"],
 :vicinity=>"727 Main Street, Springfield"}
end
# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  config.include ModelHelpers, type: :model

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
