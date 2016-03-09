require "rails_helper"

RSpec.feature "user can rate a product" do
  scenario "user sees average rating of each candy" do
    create(:candy)
    visit root_path

    within("#header-bar") do
      click_on "Candy"
    end

    click_on "Review:"
    expect(page).to have_content "Review this Candy"
    fill_in "Rating", with: "4"
    click_on "Submit"

    expect(current_path).to eq candies_path
    expect(page).to have_content "Rating: 4.0 out of 5"

    click_on "Rating: 4"
    fill_in "Rating", with: "3"
    click_on "Submit"

    expect(page).to have_content "Rating: 3.5 out of 5"
  end

  scenario "user sees not rated message if candy has no ratings" do
    create(:candy)

    visit root_path
    within("#header-bar") do
      click_on "Candy"
    end
    expect(page).to have_content "Rating: Candy has not yet been rated"
  end
end
