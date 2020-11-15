class ApplicationController < Sinatra::Base
  include Configuration
  get '/' do
    erb "Hello World"
  end

  # methods that you want to be available in the views and controllers
  helpers do

  end
end