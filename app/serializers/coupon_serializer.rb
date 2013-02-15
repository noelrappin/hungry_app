class CouponSerializer < ActiveModel::Serializer
  attributes :id, :normal_price, :sale_price, :start_date, :end_date
  has_one :restaurant
end
