class Destination < ActiveRecord::Base
  has_many :user_dests
  has_many :users, through: :user_dests
end
