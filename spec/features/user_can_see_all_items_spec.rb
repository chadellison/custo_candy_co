require 'rails_helper'

RSpec.feature "visitor can view all items in database" do
  scenario "visitor sees index view with all items" do
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)
    visit root_path
    click_on "Candy"
    expect(current_path).to eq candies_path

    expect(page).to have_content "C Title"
    expect(page).to have_content "B Title"
    expect(page).to have_content "D Title"
  end
end
