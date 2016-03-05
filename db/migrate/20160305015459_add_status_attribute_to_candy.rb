class AddStatusAttributeToCandy < ActiveRecord::Migration
  def change
    change_table :candies do |t|
      t.string :status
    end
  end
end
