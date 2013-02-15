class Restaurant < ActiveRecord::Base
  attr_accessible :name, :type
  has_many :coupons
  has_many :ratings
end
