require "rails_helper"

RSpec.feature "user can see list of all categories" do
  scenario "user sees index page of candy categories" do
    candy1 = Candy.create(title: "white chocolate bar",
                          description: "a sublime party in your mouth",
                          price: 10, image: "this path")
    candy2 = Candy.create(title: "dark chocolate bar", description: "a sublime party in your mouth", price: 10, image: "this other path")
    candy3 = Candy.create(title: "gummie bear", description: "fruit flavored sugar", price: 10, image: "path")
    candy4 = Candy.create(title: "taffy bar", description: "delectible", price: 10, image: " and path")

    chocolate = Category.create(title: "chocolate")
    gummie = Category.create(title: "gummie")

    chocolate.candies << candy1
    chocolate.candies << candy2
    gummie.candies << candy3
    gummie.candies << candy4

    visit root_path
    click_on "Candy Categories"

    expect(page).to have_content "chocolate"
    expect(page).to have_content "gummie"
  end
end
