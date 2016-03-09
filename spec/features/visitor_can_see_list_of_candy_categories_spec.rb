require "rails_helper"

RSpec.feature "user can see list of all categories" do
  scenario "user sees index page of candy categories" do
    chocolate = create(:category)
    gummie = create(:category)

    visit root_path
    within("#header-bar") do
      click_on "Candy Categories"
    end
    expect(page).to have_content chocolate.name
    expect(page).to have_content gummie.name
  end
end
