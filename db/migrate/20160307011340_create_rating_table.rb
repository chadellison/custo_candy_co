class CreateRatingTable < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer "rating"
      t.string "candy_id"
    end
  end
end
