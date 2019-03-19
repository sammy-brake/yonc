require_relative './config/environment'

use Rack::MethodOverride
# use UserController
# use RestaurantReviewController
run ApplicationController
