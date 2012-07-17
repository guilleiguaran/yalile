class CreateSaleTransactions < ActiveRecord::Migration
  def change
    create_table :sale_transactions do |t|
      t.integer :sale_id
      t.integer :article_id
      t.integer :quantity_articles
      t.integer :status
      t.float :article_unit_price_sold
      t.float :article_total_price

      t.timestamps
    end

  end
end
