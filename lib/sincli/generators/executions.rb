module Sincli
  module Generators
    class Executions < Base
      def execute
        run("git init")
        run("bundle install")
        run("rspec --init")
        configure_rspec
      end

      def configure_rspec
        insert_into_file("spec/spec_helper.rb", before: "RSpec.configure do |config|\n") do
          <<~RUBY
            ENV['SINATRA_ENV'] = 'test'
            ENV['RACK_ENV'] = 'test'
            require "./config/environment"
          RUBY
        end
        insert_into_file("spec/spec_helper.rb", after: "RSpec.configure do |config|\n") do
          <<~RUBY
            # Sinatra application
          \  def app
              ApplicationController
          \  end
  
          \  config.include Rack::Test::Methods
          RUBY
        end
      end
    end
  end
end