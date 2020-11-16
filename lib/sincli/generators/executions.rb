module Sincli
  module Generators
    class Executions < Base
      def execute
        run('git init')
        run('bundle install')
        run('rspec --init')
        configure_rspec
      end

      private

      def configure_rspec
        insert_into_file('spec/spec_helper.rb', before: "RSpec.configure do |config|\n") do
          <<~RUBY
            ENV['SINATRA_ENV'] = 'test'
            ENV['RACK_ENV'] = 'test'
            require "./config/environment"
          RUBY
        end
        insert_into_file('spec/spec_helper.rb', after: "RSpec.configure do |config|\n") do
          <<~RUBY
              # Sinatra application
            \  def app
                ApplicationController
            \  end
            \  config.include Rack::Test::Methods
            \  #{dbcleaner_config}
          RUBY
        end
      end

      def dbcleaner_config
        return if options[:no_database]

        <<~RUBY
          \  config.before(:suite) do
          \    DatabaseCleaner.strategy = :transaction
          \    DatabaseCleaner.clean_with(:truncation)
          \  end

          \  config.around(:each) do |example|
          \    DatabaseCleaner.cleaning do
          \      example.run
          \    end
          \  end
        RUBY
      end
    end
  end
end
