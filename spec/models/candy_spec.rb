require "rails_helper"

RSpec.describe Candy, type: :model do
  describe Candy do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:status) }
    it { should belong_to(:category) }
  end
  context "price format" do
    it "turns cents into dollars" do
      candy = Candy.new(price: 5000)
      expect(candy.currency).to eq(50.00)
    end
  end

  it "has many reviews" do
    candy = create(:candy)
    Review.create(rating: 3, review: "tastey", candy_id: candy.id)
    assert candy.reviews
  end
end
