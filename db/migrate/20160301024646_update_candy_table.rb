class UpdateCandyTable < ActiveRecord::Migration
  def change
    change_table :candies do |t|
      t.integer :category_id
    end
  end
end
