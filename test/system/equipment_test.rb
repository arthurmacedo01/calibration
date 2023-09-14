require "application_system_test_case"

class EquipmentTest < ApplicationSystemTestCase
  setup do
    @equipment = equipment(:one)
  end

  test "visiting the index" do
    visit equipment_url
    assert_selector "h1", text: "Equipment"
  end

  test "should create equipment" do
    visit equipment_url
    click_on "New equipment"

    fill_in "Client", with: @equipment.client_id
    fill_in "Description", with: @equipment.description
    fill_in "Manufacturer", with: @equipment.manufacturer
    fill_in "Model", with: @equipment.model
    fill_in "Serial number", with: @equipment.serial_number
    click_on "Create Equipment"

    assert_text "Equipment was successfully created"
    click_on "Back"
  end

  test "should update Equipment" do
    visit equipment_url(@equipment)
    click_on "Edit this equipment", match: :first

    fill_in "Client", with: @equipment.client_id
    fill_in "Description", with: @equipment.description
    fill_in "Manufacturer", with: @equipment.manufacturer
    fill_in "Model", with: @equipment.model
    fill_in "Serial number", with: @equipment.serial_number
    click_on "Update Equipment"

    assert_text "Equipamento atualizado com sucesso"
    click_on "Back"
  end

  test "should destroy Equipment" do
    visit equipment_url(@equipment)
    click_on "Destroy this equipment", match: :first

    assert_text "Equipamento excluído com sucesso"
  end
end
