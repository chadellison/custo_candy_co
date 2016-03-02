require "rails_helper"

RSpec.feature "user can remove items from cart" do
  scenario "user sees updated cart" do
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)

    visit candies_path

    within("##{candy1.id}") do
      click_button "Add to Cart"
    end

    within("##{candy2.id}") do
      click_button "Add to Cart"
    end

    within("##{candy3.id}") do
      click_button "Add to Cart"
    end

    visit cart_path

    expect(page).to have_content "#{candy1.title}"
    expect(page).to have_content "#{candy2.title}"
    expect(page).to have_content "#{candy3.title}"

    within("##{candy1.id}") do
      click_button "Remove"
    end

    expect(page).to have_content "Successfully removed #{candy1.title} from your cart."

    within("##{candy3.id}") do
      click_button "Remove"
    end

    expect(current_path).to eq cart_path
    expect(page).to have_content "Successfully removed #{candy3.title} from your cart."

    click_on "#{candy3.title}"
    expect(current_path).to eq candy_path(candy3.id)

    visit cart_path

    within("table") do
      expect(page).to have_content "#{candy2.title}"
      expect(page).to have_no_content "#{candy1.title}"
      expect(page).to have_no_content "#{candy3.title}"
    end
  end
end
