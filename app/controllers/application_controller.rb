require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "rangs"
  end

  get '/' do
    @user = current_user
    erb :"/index"
  end

  get '/tutorial' do
    erb :'/tutorial'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end
end
