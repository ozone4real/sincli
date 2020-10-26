ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

require_relative './application.rb'
require './app/controllers/application_controller'
require_all 'app'
