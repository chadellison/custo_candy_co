class AddColumnToCustomCandies < ActiveRecord::Migration
  def change
    add_column :custom_candies, :nuts, :string
    add_column :custom_candies, :fruits, :string
    add_column :custom_candies, :spices, :string
  end
end
