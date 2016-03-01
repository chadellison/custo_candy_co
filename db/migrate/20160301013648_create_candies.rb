class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :image

      t.timestamps null: false
    end
  end
end
