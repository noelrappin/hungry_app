# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    user nil
    restaurant nil
    score 1
  end
end
