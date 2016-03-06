require "rails_helper"

RSpec.feature "User can submit order" do
  include ActionView::Helpers::NumberHelper
  it "user sees all orders index page after submitting an order" do
    user = User.create(name: "Nate",
                       username: "nate",
                       password: "password")
    candy = create(:candy)

    visit candies_path

    within("##{candy.id}") do
      click_button "Add to Cart"
    end

    order = Order.find_by(user_id: user.id)

    visit "/login"
    fill_in "Username", with: "nate"
    fill_in "Password", with: "password"
    click_on "Sign in"

    visit "/cart"
    expect(page).to have_content candy.title
    click_on "Submit order"

    order = Order.find_by(user_id: user.id)

    candy_order = CandyOrder.find_by(candy_id: candy.id,
                                     order_id: order.id)

    expect(current_path).to eq order_success_path

    expect(page).to have_content "Your order was successful"

    click_on "Orders"

    expect(page).to have_content "Order #{order.id} #{order.created_at}"

    click_on "#{order.id}"

    price = number_to_currency(candy_order.sub_total)

    expect(page).to have_content "Status: #{order.status}"
    expect(page).to have_content "Item: #{candy.title},
                                  Quantity: #{candy_order.quantity},
                                  Subtotal: #{price},
                                  Status: #{candy.status}"
  end
end
