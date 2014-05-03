# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

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

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods
end

def signup_as_jeff
  visit new_user_url
  fill_in "Username", with: "Jeff"
  fill_in "Password", with: "abcdef"
  click_button "Sign Up"
end

def login_as_jeff
  visit new_session_url
  fill_in "Username", with: "Jeff"
  fill_in "Password", with: "abcdef"
  click_button "Log In"
end

def signup_as_buck
  visit new_user_url
  fill_in "Username", with: "Buck"
  fill_in "Password", with: "australia"
  click_button "Sign Up"
end

def login_as_buck
  visit new_session_url
  fill_in "Username", with: "Buck"
  fill_in "Password", with: "australia"
  click_button "Log In"
end

def logout
  click_button "Log Out"
end

def create_test_goal
  fill_in "Goal Title", with: "Win at App Academy"
  fill_in "Goal Description", with: "Win at AA Assessments"
  choose('Public')
  click_button("Create Goal")
  #expect(page).to have_content "Win at App Academy"
end

def create_private_goal
  fill_in "Goal Title", with: "Keep it secret"
  fill_in "Goal Description", with: "Keep it safe"
  choose('Private')
  click_button("Create Goal")
end

def create_private_goal
  fill_in "Goal Title", with: "Banana SMOOTOOOOTHIE"
  fill_in "Goal Description", with: "Keep it safe"
  choose('Public')
  click_button("Create Goal")
end