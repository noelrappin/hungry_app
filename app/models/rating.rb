class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  attr_accessible :score, :user, :restaurant, :user_id
end
