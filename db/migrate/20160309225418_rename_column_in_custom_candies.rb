class RenameColumnInCustomCandies < ActiveRecord::Migration
  def change
    rename_column :custom_candies, :name, :title
  end
end
