require 'spec_helper'

describe Restaurant do
  describe "it has ratings" do
    it "starts with an average of zero" do
      restaurant = Restaurant.new
      expect(restaurant.average_rating).to eq(0)
    end

    describe "with multiple ratings" do
      let(:restaurant) { Restaurant.new }
      before(:each) do
        restaurant.add_rating(3)
        restaurant.add_rating(5)
      end

      specify { expect(restaurant.scores).to match_array([3, 5]) }
      specify { expect(restaurant.average_rating).to eq(4) }
    end
  end
end
