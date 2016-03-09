class AddNameToReviews < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.string :name
    end
  end
end
