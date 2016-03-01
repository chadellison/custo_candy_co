class UpdateCategoryTable < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.remove :title
      t.string :name
    end
  end
end
