class ApplicationController < Sinatra::Base
  get '/' do
    "<h1>Hello World</h1>"
  end

  # methods that you want to be available in the views and controllers
  helpers do

  end
end