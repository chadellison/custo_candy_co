require "rails_helper"

RSpec.feature "user can see list of all categories" do
  scenario "user sees index page of candy categories" do
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)
    candy4 = create(:candy)

    chocolate = create(:category)
    gummie = create(:category)

    chocolate.candies << candy1
    chocolate.candies << candy2
    gummie.candies << candy3
    gummie.candies << candy4

    visit root_path
    click_on "Candy Categories"

    expect(page).to have_content "D name"
    expect(page).to have_content "A name"
  end
end
