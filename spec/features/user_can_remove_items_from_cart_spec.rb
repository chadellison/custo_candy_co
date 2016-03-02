require "rails_helper"

RSpec.feature "user can remove items from cart" do
  scenario "user sees updated cart" do

    candy1 = create(:candy)

    visit cart_path
    click_on "Remove"
    expect(current_path).to eq cart_path

    expect(page).to have_content "#{candy1.title}"

    expect(page).to have_content "Successfully removed #{candy1.title} from your cart."
    within("table") do
      expect(page).to have_no_content "#{candy1.title}"
    end

    click_on "#{candy1.title}"
    expect(current_path).to eq candy_path(candy1.id)
  end
end
