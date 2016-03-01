require 'rails_helper'

RSpec.feature "visitor can view all items in database" do
  scenario "visitor sees index view with all items" do
    candy1 = Candy.create(title: "Milk Chocolate Truffles", description: "They're delish", price: 10, image: "image path")
    candy2 = Candy.create(title: "Gummie Bears", description: "They're delish", price: 10, image: "image path")
    candy3 = Candy.create(title: "Dark Chocolate Truffles", description: "They're delish", price: 10, image: "image path")
    visit root_path
    click_on "Candy"
    expect(current_path).to eq candies_path
    expect(page).to have_content "Milk Chocolate Truffles"
    expect(page).to have_content "Gummie Bears"
    expect(page).to have_content "Dark Chocolate Truffles"
  end
end
