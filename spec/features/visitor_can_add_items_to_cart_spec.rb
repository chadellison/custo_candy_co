require "rails_helper"

RSpec.feature "User can add candy to cart" do
  scenario "user sees order summary" do
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)

    visit candies_path

    within("##{candy1.id}") do
      click_button "Add to Cart"
    end

    expect(page).to have_content "Cart updated with #{candy1.title}"
    within("##{candy3.id}") do
      click_button "Add to Cart"
    end

    expect(page).to have_content "Cart updated with #{candy3.title}"

    expect(page).to have_content "Total items: 2"

    click_on "View Cart"
    expect(current_path).to eq cart_path
    expect(page).to have_content candy1.title
    expect(page).to have_content candy1.description
    expect(page).to have_content candy1.price
    expect(page).to have_content "Total Price: $#{(candy1.price + candy3.price) / 100}"
  end
end
