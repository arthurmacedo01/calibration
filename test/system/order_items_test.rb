require "application_system_test_case"

class OrderItemsTest < ApplicationSystemTestCase
  setup do
    @order_item = order_items(:one)
  end

  test "visiting the index" do
    visit order_items_url
    assert_selector "h1", text: "Order items"
  end

  test "should create order item" do
    visit order_items_url
    click_on "New order item"

    fill_in "Accessories", with: @order_item.accessories
    fill_in "Equipment", with: @order_item.equipment_id
    fill_in "Obs", with: @order_item.obs
    fill_in "Order", with: @order_item.order_id
    fill_in "Service", with: @order_item.service_id
    fill_in "Status", with: @order_item.status
    click_on "Create Order item"

    assert_text "Order item was successfully created"
    click_on "Back"
  end

  test "should update Order item" do
    visit order_item_url(@order_item)
    click_on "Edit this order item", match: :first

    fill_in "Accessories", with: @order_item.accessories
    fill_in "Equipment", with: @order_item.equipment_id
    fill_in "Obs", with: @order_item.obs
    fill_in "Order", with: @order_item.order_id
    fill_in "Service", with: @order_item.service_id
    fill_in "Status", with: @order_item.status
    click_on "Update Order item"

    assert_text "Order item foi atualizado com sucesso"
    click_on "Back"
  end

  test "should destroy Order item" do
    visit order_item_url(@order_item)
    click_on "Destroy this order item", match: :first

    assert_text "Order item foi excluído com sucesso"
  end
end
