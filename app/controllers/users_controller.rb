class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup"
  end

  get "/login" do
    if !logged_in?
    erb :"/users/login"
    else
      redirect "/users/:name"
    end
  end

  get "/users/:name" do
    @user = User.find_by(name: params[:name])
    erb :"/users/show"
  end

  post "/signup" do
    if params[:name] == "" || params[:password] == ""
      redirect :"/signup"
    else
      User.all.each do |user|
        if user.name == params[:name]
          redirect :"/signup"
        end
      end
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect :"/users/#{@user.name}"
    end
  end

  post '/login' do
  @user = User.find_by(:name => params[:name])
  # binding.pry
  if @user
    #the below line is returing as invalid hash, but I'm not sure why
    #&& @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.name}"
  else
    redirect to '/'
  end
end

end
