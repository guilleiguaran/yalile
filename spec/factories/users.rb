# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :email do |n|
    "name#{n}@email#{n}.com"
  end

  sequence :fullname do |n|
    "Firstname#{n} Lastname#{n}"
  end

  sequence :username do |n|
    "username#{n}"
  end

  factory :user do
    email {FactoryGirl.generate :email}
    fullname {FactoryGirl.generate :fullname}
    username {FactoryGirl.generate :username}
    password "123456"
    is_admin false
  end

end
