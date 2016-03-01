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

    within("##{candy3.id}") do
      click_button "Add to Cart"
    end

    click_on "View Cart"
    expect(current_path).to eq cart_path(cart.id)

    expect(page).to have_content "#{candy1.title}"
    expect(page).to have_content "#{candy1.description}"
    expect(page).to have_content "#{candy1.price}"

    expect(page).to have_content "#{candy2.title}"
    expect(page).to have_content "#{candy2.description}"
    expect(page).to have_content "#{candy2.price}"
    expect(page).to have_content "Total Price: $4.00"
  end
end
