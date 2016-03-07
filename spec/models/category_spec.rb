require "rails_helper"

RSpec.describe Category, type: :model do
  context "can have many candies" do
    it { should have_many(:candies) }
  end
end
