require "rails_helper"

RSpec.describe Order, type: :model do
  describe Order do
    it { should have_many(:candy_orders) }
    it { should have_many(:candies) }
  end
end
