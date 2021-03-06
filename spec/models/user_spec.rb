require "rails_helper"

RSpec.describe User, type: :model do
  context "can have many orders" do
    it { should have_many(:orders) }
  end

  context "has secure password" do
    it { should have_secure_password }
  end

  context "user can be user or admin" do
    it { should define_enum_for(:role) }
  end
end
