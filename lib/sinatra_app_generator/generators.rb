require "thor"
require "active_support/core_ext/string"

class Generators < Thor
  desc "new APP_NAME", "bootstraps a new sinatra application with default configurations"
  option :db, aliases: "d", default: "sqlite"
  option :api_only, default: false, type: :boolean
  option :server, aliases: "s", default: "thin"
  def new(app_name)
    Application.new(app_name, options.dup).create
  end

  desc "generate COMPONENT NAME", "generates a sinatra component"

  def generate(component, name)
  end
end