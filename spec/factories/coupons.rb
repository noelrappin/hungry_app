# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :coupon do
    restaurant nil
    normal_price 1.5
    sale_price 1.5
    start_date "2013-02-15"
    end_date "2013-02-15"
  end
end
