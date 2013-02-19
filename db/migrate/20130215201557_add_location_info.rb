class AddLocationInfo < ActiveRecord::Migration
  def change
    add_column :users, :lat, :float
    add_column :users, :lon, :float
    add_column :restaurants, :lat, :float
    add_column :restaurants, :lon, :float
  end
end
