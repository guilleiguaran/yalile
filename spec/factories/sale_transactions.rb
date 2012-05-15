# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale_transaction do
    sale_id 1
    article_id 1
    quantity_articles 1
    article_unit_price_sold 1.5
    article_total_price 1.5
  end
end
