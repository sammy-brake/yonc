class ReviewsController < ApplicationController

  get "/reviews" do
    @reviews = Review.all
    @user = current_user
    erb :"/reviews/index"
  end

  get "/new" do
    @user = current_user
    erb :"/reviews/new"
  end

  post "/new" do
    binding.pry
    redirect :"/reviews/show"
  end

  get "/reviews/:id" do
    # @review = RingsReview.find_by_id(params[:id])
    erb :"/reviews/show"
  end

end
