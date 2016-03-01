require 'rails_helper'

RSpec.feature "user can view all items in database" do
  scenario "user sees index view with all items" do
    visit root_path
    click_on "Candy"
    expect(page).to have_content "Milk Chocolate Truffles"
    expect(page).to have_content "Gummie Bears"
    expect(page).to have_content "Dark Chocolate Truffles"
  end
end
