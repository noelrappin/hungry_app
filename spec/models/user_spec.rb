require 'spec_helper'

describe User do

  it "has an initial score of zero" do
    restaurant = Restaurant.new
    user = User.new
    expect(user.score_for(restaurant)).to eq(0)
  end

  it "grabs the average score of the merchant, normalized to 1 to 100" do
    restaurant = Restaurant.new
    restaurant.ratings << Rating.new(:score => 3)
    user = User.new
    expect(user.score_for(restaurant)).to eq(60)
  end

  it "gets the best of restaurants" do
    user = User.new
    bad_restaurant = Restaurant.new
    bad_restaurant.add_rating(1)
    good_restaurant = Restaurant.new
    good_restaurant.add_rating(4)
    expect(user.best_restaurant_among(
        [bad_restaurant, good_restaurant])).to eq(good_restaurant)
  end

end
