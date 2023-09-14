require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Date", with: @order.date
    fill_in "Doc number", with: @order.doc_number
    fill_in "Doc type", with: @order.doc_type
    fill_in "Nup", with: @order.nup
    fill_in "Sigad", with: @order.sigad
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Date", with: @order.date
    fill_in "Doc number", with: @order.doc_number
    fill_in "Doc type", with: @order.doc_type
    fill_in "Nup", with: @order.nup
    fill_in "Sigad", with: @order.sigad
    click_on "Update Order"

    assert_text "Order foi atualizado com sucesso"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order foi excluído com sucesso"
  end
end
