# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :email do |n|
    "name#{n}@email#{n}.com"
  end

  sequence :full_name do |n|
    "Firstname#{n} Lastname#{n}"
  end

  sequence :user_name do |n|
    "username#{n}"
  end

  factory :user do
    email {FactoryGirl.generate :email}
    full_name {FactoryGirl.generate :full_name}
    user_name {FactoryGirl.generate :user_name}
    password "123456"
    is_admin false
  end

end
