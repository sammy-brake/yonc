class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup"
  end

  get "/login" do
    erb :"/users/login"
  end
  ## later on, change functionality to have user slug
  get "/user" do
    erb :"/users/show"
  end

end
