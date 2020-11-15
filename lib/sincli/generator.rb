module Sincli
  class Generator < Thor
    desc "new APP_NAME", "bootstraps a new modular Sinatra application with default configurations"
    option :db, aliases: "d", default: "sqlite"
    option :api_only, default: false, type: :boolean
    option :server, aliases: "s", default: "thin"
    option :no_contrib, default: false, type: :boolean

    def new(app_name)
      Generators::Application.new(app_name, options.dup).create
    end
  end
end