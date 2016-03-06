require "rails_helper"

RSpec.feature "user can adjust quantity of items in cart" do
  scenario "user sees adjusted quantity in cart" do
    candy = create(:candy)
    visit candies_path
    click_on "Add to Cart"

    visit cart_path

    expect(page).to have_content "Total items: 1"
    expect(page).to have_content "Total Price: " + candy.to_dollars

    click_button "+"

    expect(page).to have_content "Total items: 2"
    expect(page).to have_content "Total Price: " + "$0.#{candy.price * 2}"

    click_button "-"
    expect(current_path).to eq cart_path

    expect(page).to have_content "Total items: 1"
    expect(page).to have_content "Total Price: " + candy.to_dollars
  end

  scenario "user sees error message" do
    candy = create(:candy)

    visit candies_path

    click_button "Add to Cart"

    visit cart_path

    expect(page).to have_content "Total items: 1"

    click_button "-"
    expect(page).to have_content "Total items: 0"
    click_button "-"
    expect(page).to have_content "Total items: 0"

    expect(current_path).to eq cart_path
    expect(page).to have_content "Total Price: $0.0"
  end
end
