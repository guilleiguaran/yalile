class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :salesman, :null => false

      t.timestamps
    end

    add_index :sales, :salesman, :unique => false
  end
end
