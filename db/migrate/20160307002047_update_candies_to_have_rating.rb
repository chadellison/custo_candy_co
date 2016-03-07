class UpdateCandiesToHaveRating < ActiveRecord::Migration
  def change
    change_table :candies do |t|
      t.integer :rating
    end
  end
end
