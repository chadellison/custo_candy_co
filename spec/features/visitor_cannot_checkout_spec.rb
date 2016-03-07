require "rails_helper"

RSpec.feature "User can add candy to cart" do
  scenario "user sees order summary" do
    candy1 = create(:candy)

    visit candies_path
    within("##{candy1.id}") do
      click_button "Add to Cart"
    end

    price = candy1.to_dollars

    click_on "View Cart"
    expect(current_path).to eq cart_path
    expect(page).to have_content candy1.title
    expect(page).to have_content candy1.description
    expect(page).to have_content candy1.price
    expect(page).to have_content "Total Price: #{price}"

    click_on "Submit order"

    msg = "You must login or register for an account before checking out"

    expect(current_path).to eq cart_path
    expect(page).to have_content msg
  end
end
