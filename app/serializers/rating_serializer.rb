class RatingSerializer < ActiveModel::Serializer
  attributes :id, :score
  has_one :user
  has_one :restaurant
end
