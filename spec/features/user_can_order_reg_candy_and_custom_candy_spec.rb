require "rails_helper"

RSpec.feature "user_can_order_regular_candy_with_custom_candy" do
  include ActionView::Helpers::NumberHelper
  scenario "user sees all products in cart" do
    candy = create(:candy)

    visit root_path

    within("#header-bar") do
      click_on "Candy"
    end

    click_button "Add to Cart"

    within("#header-bar") do
      click_on "Create your Candy"
    end

    fill_in "Name your candy", with: "Hoss Candy"
    select "Milk Chocolate", from: "Category"
    select "Whiskey", from: "Fillings"
    select "Almonds", from: "Nuts"
    select "Cherries", from: "Fruits"
    select "Cayenne", from: "Spices"

    click_on "Create Candy"

    expect(page).to have_content "Your Custom Candy"
    expect(page).to have_content "Hoss Candy"
    expect(page).to have_content "Chocolate: Milk Chocolate"
    expect(page).to have_content "Filling: Whiskey"
    expect(page).to have_content "Nut: Almonds"
    expect(page).to have_content "Fruit: Cherries"
    expect(page).to have_content "Spice: Cayenne"
    expect(page).to have_content "Custom Candy Price: $8.00"

    click_on "Add to Cart"

    within("#header-bar") do
      click_on "View Cart"
    end
    total = candy.currency + CustomCandy.last.currency
    expect(page).to have_content "Hoss Candy"
    description = "Delicious Milk Chocolate Whiskey Almonds Cherries Cayenne"
    expect(page).to have_content description
    expect(page).to have_content "Total Price: #{number_to_currency(total)}"
  end
end
