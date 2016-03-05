class CreateCandyOrder < ActiveRecord::Migration
  def change
    create_table :candy_orders do |t|
      t.references :candy, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer :quantity
      t.integer :sub_total
    end
  end
end
