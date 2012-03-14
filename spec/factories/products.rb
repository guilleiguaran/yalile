# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :name do |n|
    "product #{n}"
  end

  factory :product do
    name { FactoryGirl.generate(:name) }
  end

end
