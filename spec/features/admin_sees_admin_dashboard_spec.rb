require "rails_helper"

RSpec.feature "Admin sees admin dashboard" do
  scenario "admin sees admin heading" do
    admin = User.create(username: "jones", password: "password", role: 1)

    visit root_path

    click_on "Login"
    fill_in "Username", with: "jones"
    fill_in "Password", with: "password"
    click_on "Sign in"

    expect(page).to have_content "Admin Dashboard"
  end
end
