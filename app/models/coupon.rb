class Coupon < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :end_date, :normal_price, :sale_price, :start_date,
      :restaurant, :restaurant_id
end
