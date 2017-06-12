class User < ActiveRecord::Base
  # DECLARATIONS
  devise :database_authenticatable, :registerable, :validatable
end