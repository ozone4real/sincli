ENV['SINATRA_ENV'] ||= "development"
secret_key_path = "#{Dir.getwd}/config/secret_key.txt"
ENV['SECRET_KEY'] ||=  File.read(secret_key_path)


require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

require './app/controllers/application_controller'
require_all 'config/initializers'
require_all 'app'
