class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable, :timeoutable, 
  # :recoverable, :rememberable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
end