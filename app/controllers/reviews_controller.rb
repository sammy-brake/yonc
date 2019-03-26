class ReviewsController < ApplicationController

  get "/reviews" do
    @reviews = Review.all
    @user = User.find_by(id: session[:user_id])
    erb :"/reviews/index"
  end

  get "/new" do
    if logged_in?
      @user = current_user
      erb :"/reviews/new"
    else
      redirect "/login"
    end
  end

  post "/new" do
    if params[:location] == "" || params[:review] == "" || params[:date] == ""
      redirect :"/reviews/new"
    else
      @review = Review.new(location: params[:location], review: params[:review], date: params[:date])
      @review.user = User.find_by(id: session[:user_id])
       @review.save
      #don't save until everything is set up

    redirect :"/reviews/#{@review.id}"
    end
  end

  get "/reviews/:id" do
     @review = Review.find_by_id(params[:id])
    erb :"/reviews/show"
  end

  get "/reviews/:id/edit" do
    @review = Review.find_by_id(params[:id])
    erb :"/reviews/#{params[:id]}/edit}"
  end

end
