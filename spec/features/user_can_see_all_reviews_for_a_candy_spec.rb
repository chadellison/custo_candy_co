require "rails_helper"

RSpec.feature "user can see all reviews for a candy" do
  scenario "user sees each review" do
    candy = create(:candy)
    category = Category.create(name: "Chocolates")
    category.candies << candy
    Review.create(name: "Bill", rating: "4", candy_id: candy.id, review: "tasty")
    Review.create(name: "Rosco", rating: "5", candy_id: candy.id, review: "amazing!")

    visit candies_path

    click_on "More Info"

    expect("/candies/#{candy.id}").to eq current_path
    expect(page).to have_content candy.title
    expect(page).to have_css("img[src*='#{candy.image}']")
    expect(page).to have_content "Description: #{candy.description}"
    expect(page).to have_content "Price: #{candy.to_dollars}"
    expect(page).to have_content "Status: In Stock"
    expect(page).to have_content "Category: Chocolates"
    expect(page).to have_content "Rating: 4.5 out of 5"

    expect(page).to have_content "Reviews"
    expect(page).to have_content "Bill"
    expect(page).to have_content "4"
    expect(page).to have_content "tasty"
    expect(page).to have_content "Rosco"
    expect(page).to have_content "5"
    expect(page).to have_content "amazing!"

    click_on "Review this Candy"
    expect("/reviews").to eq current_path
  end
end
