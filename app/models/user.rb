class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
      :first_name, :last_name

  attr_accessible :email, :first_name, :last_name

  def score_for(restaurant)
    restaurant.average_rating * 20
  end

  def best_restaurant_among(restaurants)
    restaurants.max_by { |d| score_for(d) }
  end

end
