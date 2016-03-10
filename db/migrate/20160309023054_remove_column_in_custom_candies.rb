class RemoveColumnInCustomCandies < ActiveRecord::Migration
  def change
    remove_column :custom_candies, :addons, :string
  end
end
