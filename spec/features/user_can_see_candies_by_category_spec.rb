require 'rails_helper'

RSpec.feature "user can see candies by category" do
  scenario "user sees each candy in a category" do
    candy1 = Candy.create(title: "white chocolate bar", description: "a sublime party in your mouth", price: 10, image: "this path")
    candy2 = Candy.create(title: "dark chocolate bar", description: "a sublime party in your mouth", price: 10, image: "this other path")
    candy3 = Candy.create(title: "gummie bear", description: "fruit flavored sugar", price: 10, image: "path")
    candy4 = Candy.create(title: "taffy bar", description: "delectible", price: 10, image: " and path")

    chocolate = Category.create(title: "chocolate")
    gummie = Category.create(title: "gummie")

    chocolate.candies << candy1
    chocolate.candies << candy2
    gummie.candies << candy3
    gummie.candies << candy4

    visit category_path(chocolate.id)
    expect(page).to have_content "white chocolate bar"
    expect(page).to have_content "dark chocolate bar"
    expect(page).to have_no_content "gummie bear"
    expect(page).to have_no_content "taffy bar"

    visit category_path(gummie.id)
    expect(page).to have_content "gummie bear"
    expect(page).to have_content "taffy bar"
    expect(page).to have_no_content "white chocolate bar"
    expect(page).to have_no_content "dark chocolate bar"
  end
end
