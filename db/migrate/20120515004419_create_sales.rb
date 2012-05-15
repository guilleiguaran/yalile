class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :salesman

      t.timestamps
    end
  end
end
