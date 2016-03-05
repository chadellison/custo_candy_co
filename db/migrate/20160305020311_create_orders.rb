class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.references :user, index: true, foreign_key: true
    end
  end
end
