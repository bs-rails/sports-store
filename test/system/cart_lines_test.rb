require "application_system_test_case"

class CartLinesTest < ApplicationSystemTestCase
  setup do
    @cart_line = cart_lines(:one)
  end

  test "visiting the index" do
    visit cart_lines_url
    assert_selector "h1", text: "Cart lines"
  end

  test "should create cart line" do
    visit cart_lines_url
    click_on "New cart line"

    fill_in "Cart", with: @cart_line.cart_id
    fill_in "Product", with: @cart_line.product_id
    fill_in "Quantity", with: @cart_line.quantity
    click_on "Create Cart line"

    assert_text "Cart line was successfully created"
    click_on "Back"
  end

  test "should update Cart line" do
    visit cart_line_url(@cart_line)
    click_on "Edit this cart line", match: :first

    fill_in "Cart", with: @cart_line.cart_id
    fill_in "Product", with: @cart_line.product_id
    fill_in "Quantity", with: @cart_line.quantity
    click_on "Update Cart line"

    assert_text "Cart line was successfully updated"
    click_on "Back"
  end

  test "should destroy Cart line" do
    visit cart_line_url(@cart_line)
    click_on "Destroy this cart line", match: :first

    assert_text "Cart line was successfully destroyed"
  end
end
