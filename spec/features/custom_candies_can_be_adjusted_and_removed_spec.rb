require "rails_helper"

RSpec.feature "user can adjust the quantity and remove a custom candy" do
  scenario "user sees updated cart" do
    visit root_path

    within("#header-bar") do
      click_on "Create your Candy"
    end

    fill_in "Name your candy", with: "The Hoss Beast Chocolate"
    select "White Chocolate", from: "Category"
    select "Caramel", from: "Fillings"
    select "Almonds", from: "Nuts"
    select "Pineapple", from: "Fruits"
    select "Curry", from: "Spices"

    click_on "Create Candy"

    click_on "Add to Cart"

    within("#header-bar") do
      click_on "View Cart"
    end

    click_on "+"
    click_on "+"
    expect(page).to have_content "The Hoss Beast Chocolate"
    expect(page).to have_content "3"
    click_on "Remove"
    expect(page).to have_content "You have no items in your cart"
  end
end
