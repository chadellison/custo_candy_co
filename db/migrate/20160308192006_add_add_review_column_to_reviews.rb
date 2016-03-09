class AddAddReviewColumnToReviews < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.string :review
    end
  end
end
