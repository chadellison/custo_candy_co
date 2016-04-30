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

    visit "/categories/#{chocolate.id}"
    expect(page).to have_content candy1.title
    expect(page).to have_content candy2.title
    expect(page).to have_no_content candy3.title
    expect(page).to have_no_content candy4.title

    visit "/categories/#{gummie.id}"
    expect(page).to have_content candy3.title
    expect(page).to have_content candy4.title

    expect(page).to have_no_content candy1.title
    expect(page).to have_no_content candy2.title
  end
end
