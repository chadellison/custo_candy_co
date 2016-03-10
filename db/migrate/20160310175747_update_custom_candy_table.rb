class UpdateCustomCandyTable < ActiveRecord::Migration
  def change
    change_table :custom_candies do |t|
      t.integer :order_id
      t.integer :quantity
    end
  end
end
