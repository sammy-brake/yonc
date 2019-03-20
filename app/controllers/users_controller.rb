class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup"
  end

  get "/login" do
    erb :"/users/login"
  end

  get "/users/:name" do
    @user = User.find_by(name: params[:name])
    erb :"/users/show"
  end

  post "/signup" do
    if params[:name] == "" || params[:password_digest] == ""
      redirect :"/signup"
    else

      User.all.each do |user|
        if user.name == params[:name]
          redirect :"/signup"
        end
      end
      @user = User.create(params)
      redirect :"/users/#{@user.name}"
    end
  end

end
