class Restaurant < ActiveRecord::Base
  attr_accessible :name, :type
  has_many :coupons
  has_many :ratings

  def add_rating(score)
    ratings << Rating.new(:score => score)
  end

  def average_rating
    return 0 if ratings.size == 0
    scores.inject(:+) * 1.0 / ratings.size
  end

  def scores
    ratings.map(&:score)
  end
end
