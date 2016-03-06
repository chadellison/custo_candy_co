require "rails_helper"

RSpec.feature "admin can create candy" do
  scenario "admin sees all candies with the created candy" do
    category = Category.create(name: "Chocolate")
    admin = User.create(username: "jones", name: "jones", password: "password", role: 1)

    visit root_path
    click_on "Login"
    fill_in "Username", with: "jones"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "Create Candy"

    fill_in "Title", with: "chocolate bar"
    fill_in "Description", with: "lushous and pretentious"
    fill_in "Price", with: "400"
    fill_in "Image", with: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ"
    fill_in "Status", with: "In Stock"
    fill_in "Category", with: category.id

    click_on "Create Candy"

    expect(page).to have_content "chocolate bar"
    expect(page).to have_content "lushous and pretentious"
    expect(page).to have_content "$4.00"
    expect(page).to have_css("img[src*='https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ']")
    expect(page).to have_content "In Stock"
  end


  scenario "admin sees error message if field is left blank" do
    admin = User.create(username: "jones", name: "jones", password: "password", role: 1)
    visit root_path
    click_on "Login"
    fill_in "Username", with: "jones"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "Create Candy"

    fill_in "Title", with: "chocolate bar"
    fill_in "Description", with: "lushous and pretentious"
    fill_in "Price", with: "400"
    fill_in "Image", with: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ"
    fill_in "Status", with: "In Stock"

    click_on "Create Candy"

    expect(page).to have_content "All fields are required"

  end

  scenario "admin sees default image if one is not entered" do
    admin = User.create(username: "jones", name: "jones", password: "password", role: 1)
    category = Category.create(name: "Chocolate")
    default_image = "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ"

    visit root_path
    click_on "Login"
    fill_in "Username", with: "jones"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "Create Candy"

    fill_in "Title", with: "chocolate bar"
    fill_in "Description", with: "lushous and pretentious"
    fill_in "Price", with: "400"
    fill_in "Status", with: "In Stock"
    fill_in "Category", with: category.id

    click_on "Create Candy"

    expect(page).to have_css("img[src*='https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ']")
  end

  scenario "a non-admin sees error message" do

  end
end

#         - The price must be a valid decimal numeric value and greater than zero.
