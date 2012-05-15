class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :product_id
      t.text :description, :null => false
      t.string :size, :null =>  false
      t.integer :in_stock, :default => 0
      t.string :code, :null =>  false
      t.integer :status

      t.timestamps
    end

    add_index :articles, :description, :unique => false, :length => 100
    add_index :articles, :size, :unique => false
    add_index :articles, :code, :unique => true
  end
end
