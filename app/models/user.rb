class User < ActiveRecord::Base
  has_many :user_dests
  has_many :destinations, through: :user_dests
  has_secure_password
end
