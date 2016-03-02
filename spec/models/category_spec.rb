require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:candies) }
  context "can have many candies" do
  end
end
