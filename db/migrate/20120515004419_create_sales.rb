class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :user_id, null: false
      t.integer :total_articles, null: false
      t.float :total, null: false
      t.timestamps
    end

    add_index :sales, :user_id, unique: false
  end
end
