require "rails_helper"

RSpec.feature "user can login to account" do
  it "user can see user login welcome page after loggin in" do
    User.create(name: "Nate", username: "nate", password: "password")
    visit "/"
    within("#header-bar") do
      click_on "Login"
    end

    expect("/login").to eq current_path

    fill_in "Username", with: "nate"
    fill_in "Password", with: "password"

    click_on "Sign in"

    expect("/dashboard").to eq current_path

    expect(page).to have_content "Logged in as nate"
    expect(page).to have_link "Logout"
    expect(page).to_not have_link "Login"
    expect(page).to have_content "Profile"
    expect(page).to have_content "Name: Nate"
    expect(page).to have_content "Username: nate"
  end
end
