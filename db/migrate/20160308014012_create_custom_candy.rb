class CreateCustomCandy < ActiveRecord::Migration
  def change
    create_table :custom_candies do |t|
      t.string :category
      t.string :fillings
      t.string :addons
    end
  end
end
