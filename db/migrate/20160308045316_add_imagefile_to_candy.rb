class AddImagefileToCandy < ActiveRecord::Migration
  def self.up
    add_attachment :candies, :image
  end

  def self.down
    remove_attachment :candies, :image
  end
end
