class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :product_id, :null => false
      t.text :description
      t.string :size, :null => false
      t.integer :in_stock, :default => 0, :null => false
      t.string :code, :null => false

      t.timestamps
    end
    add_index :items, [:product_id, :size], :unique => false
    add_index :items, :code, :unique => true
  end
end
