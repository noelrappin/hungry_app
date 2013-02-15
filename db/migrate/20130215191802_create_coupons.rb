class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.references :restaurant
      t.float :normal_price
      t.float :sale_price
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :coupons, :restaurant_id
  end
end
