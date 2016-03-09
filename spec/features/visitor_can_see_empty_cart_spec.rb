require "rails_helper"

RSpec.feature "user can click shopping cart with no items" do
  it "visitor sees message when visiting an empty cart" do
    visit candies_path
    within("#header-bar") do
      click_on "View Cart"
    end

    result = "You have no items in your cart"
    expect(page).to have_content result
  end
end
