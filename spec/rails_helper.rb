# This file is copied to spec/ when you run "rails generate rspec:install"
require "simplecov"
SimpleCov.start "rails" do
  add_filter "/spec/"
  add_filter "/app/channels/"
  add_filter "/app/jobs/"
  add_filter "/app/mailers/"
  add_filter "/app/controllers/admin"
end

require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
# Uncomment the line below in case you have `--require rails_helper` in the `.rspec` file
# that will avoid rails generators crashing because migrations haven"t been run yet
# return unless Rails.env.test?
require "rspec/rails"
require 'pundit/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

require "timecop"
# require_relative "../spec/support/shoulda_matchers.rb"
# require_relative "../spec/support/webmock.rb"
# require_relative "../spec/support/vcr.rb"
# require_relative "../spec/support/login_helpers.rb"
# require_relative "../spec/support/fixtures_helpers.rb"

Rails.root.glob('spec/support/**/*.rb').sort_by(&:to_s).each { |f| require f }

# RSpec::Mocks.configuration.allow_message_expectations_on_nil = true

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  # Remove this line if you"re not using ActiveRecord or ActiveRecord fixtures
  config.fixture_paths = [
    Rails.root.join("spec/fixtures")
  ]

  # If you"re not using ActiveRecord, or you"d prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  config.before :suite do
    Audited.auditing_enabled = false
    # DatabaseCleaner.clean_with :deletion
    # SeedFu.quiet = true
    # SeedFu.seed
  end

  # config.after :example do
  #   Warden.test_reset!
  # end

  # config.before :example, delayed_job: true do
  #   Delayed::Worker.delay_jobs = true
  # end

  # config.after :example, delayed_job: true do
  #   Delayed::Worker.delay_jobs = false
  # end

  # config.before :example, type: :system do
  #   WebMock.disable_net_connect!(net_http_connect_on_start: true)
  # end

  # config.after :example, type: :system do
  #   WebMock.allow_net_connect!
  # end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/7-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include LoginHelpers, type: :request

  # config.extend LoginHelpers, type: :controller
  # config.include FixturesHelpers, type: :controller
  # config.include FixturesHelpers, type: :request
  # config.include FixturesHelpers, type: :model
end
