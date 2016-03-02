require "rails_helper"

RSpec.feature "User can add candy to cart" do
  scenario "user sees order summary" do
    candy1 = create(:candy)

    visit candies_path

    click_button "Add to Cart"

    expect(page).to have_content "Cart updated with #{candy1.title}"

    expect(page).to have_content "Total items: 1"

    click_on "View Cart"
    expect(current_path).to eq cart_path
    expect(page).to have_content candy1.title
    expect(page).to have_content candy1.description
    expect(page).to have_content candy1.price
    expect(page).to have_content "Total Price: $0.02"
  end
end
