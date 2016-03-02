require 'rails_helper'

RSpec.feature "visitor can view all items in database" do
  scenario "visitor sees index view with all items" do
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)
    visit root_path
    within(".header") do
      click_on "Candy"
    end
    expect(current_path).to eq candies_path

    expect(page).to have_content candy1.title
    expect(page).to have_content candy2.title
    expect(page).to have_content candy3.title
  end
end
