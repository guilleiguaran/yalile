# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    product
    description "MyText"
    size "MyString"
    in_stock 1
    code "MyString"
  end
end
