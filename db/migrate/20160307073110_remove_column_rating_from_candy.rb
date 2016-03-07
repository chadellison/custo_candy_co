class RemoveColumnRatingFromCandy < ActiveRecord::Migration
  def change
    change_table :candies do |t|
      t.remove :rating
    end
  end
end
