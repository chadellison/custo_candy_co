require "rails_helper"

RSpec.feature "admin can create candy" do
  scenario "admin sees all candies with the created candy" do
    category = create(:category)
    User.create(username: "jones", name: "jones", password: "password", role: 1)

    visit root_path
    within("#header-bar") do
      click_on "Login"
    end
    fill_in "Username", with: "jones"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "Create Candy"

    fill_in "Title", with: "chocolate bar"
    fill_in "Description", with: "lushous and pretentious"
    fill_in "Price", with: "400"
    fill_in "Image", with: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ"
    select "In Stock", from: "Status"
    select "#{category.name}", from: "Category"

    click_on "Create Candy"

    expect(page).to have_content "chocolate bar"
    expect(page).to have_content "lushous and pretentious"
    expect(page).to have_content "$4.00"
    expect(page).to have_css("img[src*='https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ']")
    expect(page).to have_content "In Stock"
  end

  scenario "admin sees error message if field is left blank" do
    User.create(username: "jones", name: "jones", password: "password", role: 1)
    visit root_path
    within("#header-bar") do
      click_on "Login"
    end
    fill_in "Username", with: "jones"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "Create Candy"

    fill_in "Title", with: "chocolate bar"
    fill_in "Description", with: "lushous and pretentious"
    fill_in "Price", with: "400"
    fill_in "Image", with: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ"
    select "In Stock", from: "Status"

    click_on "Create Candy"

    expect(page).to have_content "All fields are required"
  end

  scenario "admin sees default image if one is not entered" do
    User.create(username: "jones", name: "jones", password: "password", role: 1)
    category = Category.create(name: "Chocolate")
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ"

    visit root_path
    within("#header-bar") do
      click_on "Login"
    end
    fill_in "Username", with: "jones"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "Create Candy"

    fill_in "Title", with: "chocolate bar"
    fill_in "Description", with: "lushous and pretentious"
    fill_in "Price", with: "400"
    select "In Stock", from: "Status"
    select "#{category.name}", from: "Category"

    click_on "Create Candy"

    expect(page).to have_css("img[src*='https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ']")
  end

  scenario "a non-admin sees error message" do
    User.create(username: "bill", name: "bill", password: "password")

    visit new_admin_candy_path
    expect(page).to have_content "The page you were looking for doesn't exist."

    visit root_path
    within("#header-bar") do
      click_on "Login"
    end
    fill_in "Username", with: "bill"
    fill_in "Password", with: "password"
    click_on "Sign in"

    expect(current_path).to eq dashboard_path

    visit new_admin_candy_path
    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
