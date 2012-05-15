# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    product_id 1
    description "MyText"
    size 1.5
    in_stock 1
    code "MyString"
    status 1
  end
end
