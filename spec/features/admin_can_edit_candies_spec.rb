require "rails_helper"

RSpec.feature "admin can edit candies" do
  scenario "admin sees updated candies" do
    candy1 = create(:candy)
    User.create(username: "jones", name: "jones", password: "password", role: 1)

    visit root_path
    within("#header-bar") do
      click_on "Login"
    end
    fill_in "Username", with: "jones"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "View All Candies"

    expect(current_path).to eq "/admin/candies"
    expect(page).to have_content candy1.description
    expect(page).to have_content candy1.to_dollars
    expect(page).to have_content candy1.status

    click_on candy1.title
    expect(current_path).to eq "/admin/candies/#{candy1.id}"

    click_on "Back to Candies"

    click_on "Edit"

    fill_in "Title", with: "chocolate bar"
    fill_in "Description", with: "It is juicy"
    fill_in "Price", with: "1000"
    select "Out of Stock", from: "Status"
    attach_file "Image", "spec/asset_specs/images/upside-down-rachel.jpg"
    click_on "Update Candy"

    expect(page).to have_content "chocolate bar"
    expect(page).to have_content "It is juicy"
    expect(page).to have_content "$10.00"
    expect(page).to have_content "Out of Stock"
  end
end
