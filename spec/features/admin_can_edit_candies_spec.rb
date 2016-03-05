require "rails_helper"

RSpec.feature "admin can edit candies" do
  scenario "admin sees updated candies" do

    candy1 = create(:candy)

    admin = User.create(username: "jones", name: "jones", password: "password", role: 1)

    visit root_path
    click_on "Login"
    fill_in "Username", with: "jones"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "View All Candies"
    expect(current_path).to eq admin_candies_path

    within("img") do
      expect(page).to have_content "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSHDOSNxmatCFt8kQLujghKqW3dlmgvBhMrqBd747RP95UQTuDzRF7838s"
    end

    expect(page).to have_content candy1.description
    expect(page).to have_content candy1.price
    expect(page).to have_content candy1.status

    click_on candy1.title
    expect(current_path).to eq admin_candy_path

    visit admin_dashboard_path

    click_on "Edit"

    fill_in "Title", with: "chocolate bar"
    fill_in "Description", with: "It is juicy"
    fill_in "Price", with: "10"
    fill_in "Status", with: "Out of stock"
    fill_in "Image", with: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ"
    click_on "Update Candy"

    expect(page).to have_content "chocolate bar"
    expect(page).to have_content "It is juicy"
    expect(page).to have_content "$10.00"
    expect(page).to have_content "Out of stock"
    within("img") do
      expect(page).to have_content "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ"
    end
  end
end
