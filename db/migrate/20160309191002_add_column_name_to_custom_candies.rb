class AddColumnNameToCustomCandies < ActiveRecord::Migration
  def change
    add_column :custom_candies, :name, :string
  end
end
