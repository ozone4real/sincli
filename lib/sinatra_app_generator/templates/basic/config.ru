require './config/environment'

if ActiveRecord::MigrationContext.new('./db/migrate').needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

config_path = Pathname.new("config/sinatra.rb")

f = config_path.read

ApplicationController.class_eval(f, config_path.to_s)

map ApplicationController.assets_prefix do
  run ApplicationController.environment
end

run ApplicationController
ApplicationController.subclasses.each {|klass| use klass }

