class AddCategories < ActiveRecord::Migration
  def change
    add_column :restaurants, :category, :string
    add_column :users, :favorite_categories, :text
  end
end
