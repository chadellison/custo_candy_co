require 'rails_helper'

RSpec.feature "user can see candies by category" do
  scenario "user sees each candy in a category" do

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

    visit category_path(chocolate.id)
    expect(page).to have_content "A Title"
    expect(page).to have_content "C Title"
    expect(page).to have_no_content "B Title"
    expect(page).to have_no_content "D Title"

    visit category_path(gummie.id)
    expect(page).to have_content "B Title"
    expect(page).to have_content "D Title"

    expect(page).to have_no_content "A Title"
    expect(page).to have_no_content "C Title"
  end
end
