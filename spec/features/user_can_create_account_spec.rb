require "rails_helper"

RSpec.feature "user can create account" do
  it "user can see user login welcome page" do
    visit "/"
    
    within("#header-bar") do
      click_on "Create Account"
    end

    expect("/register").to eq current_path

    fill_in "Name", with: "Nate"
    fill_in "Username", with: "nate"
    fill_in "Password", with: "password"

    click_on "Sign up"

    expect("/dashboard").to eq current_path

    expect(page).to have_content "Logged in as nate"
    expect(page).to have_link "Logout"
    expect(page).to_not have_link "Login"
    expect(page).to have_content "Profile"
    expect(page).to have_content "Name: Nate"
    expect(page).to have_content "Username: nate"
  end
end
