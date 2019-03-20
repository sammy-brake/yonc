class User < ActiveRecord::Base
  has_many :ringsreviews
  has_secure_password
end
