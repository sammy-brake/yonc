require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "rangs"
  end

  get '/' do
  "Welcome to Onion Rings Group for Yonc!"

  erb :"/index"
  end
end
