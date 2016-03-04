require "rails_helper"

RSpec.feature "Admin sees admin dashboard" do
  scenario "admin sees admin heading" do
    admin = User.create(username: "jones", password: "password", role: 1)

    visit root_path

    click_on "Login"
    fill_in "Username", with: admin.username.to_s
    fill_in "Password", with: "password"
    click_on "Sign in"

    expect(page).to have_content "Admin Dashboard"
  end

  scenario "regular sees page not found message" do
    user = User.create(username: "bill", name: "bill", password: "password")

    visit root_path

    click_on "Login"
    fill_in "Username", with: "bill"
    fill_in "Password", with: "password"
    click_on "Sign in"

    visit admin_dashboard_path(user.id)

    expect(page).to have_content "The page you were looking for doesn't exist."

    visit root_path

    click_on "Logout"

    visit admin_dashboard_path(user.id)

    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
