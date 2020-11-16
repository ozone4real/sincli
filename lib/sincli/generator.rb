module Sincli
  class Generator < Thor
    def self.exit_on_failure?
      true
    end

    desc 'new APP_NAME', 'bootstraps a new modular Sinatra application with default configurations'
    option :db, aliases: 'd', default: 'sqlite', desc: 'Database to use. Negated if the --no-database flag is passed', enum: %w[sqlite postgres mysql]
    option :api_only, default: false, type: :boolean, desc: 'Set up a Sinatra API application with only the basic things that are needed to build an API.'
    option :server, aliases: 's', default: 'thin', desc: 'Rack-based server to use', enum: %w[puma thin falcon webrick]
    option :no_contrib, default: false, type: :boolean, desc: 'Setup without sinatra-contrib extensions'
    option :no_database, default: false, type: :boolean, desc: 'Setup without ActiveRecord and database config'

    def new(app_name)
      Generators::Application.new(app_name, options.dup).create
    end
  end
end
