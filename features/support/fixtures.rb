# # Sets up the Rails environment for Cucumber
# ENV["RAILS_ENV"] = "test"
# require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
# require 'cucumber/rails/world'
# Cucumber::Rails::World.use_transactional_fixtures

# #Seed the DB
# ActiveRecord::Fixtures.reset_cache
# fixtures_folder = File.join(Rails.root, 'spec', 'fixtures')
# fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
# ActiveRecord::Fixtures.create_fixtures(fixtures_folder, fixtures)
include ActionController::RecordIdentifier
module FixtureAccess

  def self.setup_fixture_accessors(fixture_names = nil)
    fixture_names = Array.wrap(fixture_names || fixture_table_names)
    methods = Module.new do
      fixture_names.each do |fixture_name|
        fixture_name = fixture_name.to_s.tr('./', '_')

        define_method(fixture_name) do |*fixtures|
          force_reload = fixtures.pop if fixtures.last == true || fixtures.last == :reload

          @fixture_cache[fixture_name] ||= {}

          instances = fixtures.map do |fixture|
            @fixture_cache[fixture_name].delete(fixture) if force_reload

            if @loaded_fixtures[fixture_name][fixture.to_s]
              ActiveRecord::IdentityMap.without do
                @fixture_cache[fixture_name][fixture] ||= @loaded_fixtures[fixture_name][fixture.to_s].find
              end
            else
              raise StandardError, "No fixture with name '#{fixture}' found for table '#{fixture_name}'"
            end
          end

          instances.size == 1 ? instances.first : instances
        end
        private fixture_name
      end
    end
    include methods
  end

  def self.extended(base)

    ActiveRecord::Fixtures.reset_cache
    fixtures_folder = File.join(Rails.root, 'spec', 'fixtures')
    fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
    fixtures += Dir[File.join(fixtures_folder, '*.csv')].map {|f| File.basename(f, '.csv') }

    ActiveRecord::Fixtures.create_fixtures(fixtures_folder, fixtures)    # This will populate the test database tables

    (class << base; self; end).class_eval do
      @@fixture_cache = {}
      fixtures.each do |table_name|
        table_name = table_name.to_s.tr('.', '_')
        define_method(table_name) do |*fixture_symbols|
          @@fixture_cache[table_name] ||= {}

          instances = fixture_symbols.map do |fixture_symbol|
            if fix = ActiveRecord::Fixtures.cached_fixtures(ActiveRecord::Base.connection, table_name)[0].fixtures[fixture_symbol.to_s]
              @@fixture_cache[table_name][fixture_symbol] ||= fix.find  # find model.find's the instance
            else
              raise StandardError, "No fixture with name '#{fixture_symbol}' found for table '#{table_name}'"
            end
          end
          instances.size == 1 ? instances.first : instances
        end
      end
    end
  end

end

World(FixtureAccess)
# require 'email_spec' # add this line if you use spork
# require 'email_spec/cucumber'
