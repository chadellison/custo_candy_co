require "rails_helper"

RSpec.feature "visitor can create custom candy" do
  it "visitor can see custom candy in the cart page" do
    visit root_path

    within("#header-bar") do
      click_on "Create your Candy"
    end

    fill_in "Name your candy", with: "Dank Goodness"
    select "Milk Chocolate", from: "Category"
    select "Whiskey", from: "Fillings"
    select "Almonds", from: "Nuts"
    select "Cherries", from: "Fruits"
    select "Cayenne", from: "Spices"

    click_on "Create Candy"

    expect(custom_candy_path(CustomCandy.last.id)).to eq current_path
    expect(page).to have_content "Dank Goodness"
    expect(page).to have_content "Your Custom Candy"
    expect(page).to have_content "Chocolate: Milk Chocolate"
    expect(page).to have_content "Filling: Whiskey"
    expect(page).to have_content "Nut: Almonds"
    expect(page).to have_content "Fruit: Cherries"
    expect(page).to have_content "Spice: Cayenne"
    expect(page).to have_content "Custom Candy Price: $8.00"

    click_on "Add to Cart"

    within("#header-bar") do
      click_on "View Cart"
    end
    expect(page).to have_content "Dank Goodness"
    description = "Delicious Milk Chocolate Whiskey Almonds Cherries Cayenne"
    expect(page).to have_content description
    expect(page).to have_content "$8.00"

    within("#header-bar") do
      click_on "Create your Candy"
    end

    fill_in "Name your candy", with: "Yum yo"
    select "Milk Chocolate", from: "Category"
    select "Whiskey", from: "Fillings"
    select "Almonds", from: "Nuts"

    click_on "Create Candy"

    expect(page).to have_content "Your Custom Candy"
    expect(page).to have_content "Yum yo"
    expect(page).to have_content "Chocolate: Milk Chocolate"
    expect(page).to have_content "Filling: Whiskey"
    expect(page).to have_content "Nut: Almonds"
    expect(page).to have_content "Custom Candy Price: $6.00"

    click_on "Add to Cart"

    within("#header-bar") do
      click_on "View Cart"
    end

    description = "Delicious Milk Chocolate Whiskey Almonds Cherries Cayenne"

    expect(page).to have_content "Dank Goodness"
    expect(page).to have_content description
    expect(page).to have_content "$8.00"

    expect(page).to have_content "Yum yo"
    expect(page).to have_content "Delicious Milk Chocolate Whiskey Almonds"
    expect(page).to have_content "$6.00"
  end
end
