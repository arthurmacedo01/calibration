require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit clients_url
    click_on "New client"

    fill_in "Division", with: @client.division
    fill_in "Name", with: @client.name
    fill_in "Subdivision", with: @client.subdivision
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit client_url(@client)
    click_on "Edit this client", match: :first

    fill_in "Division", with: @client.division
    fill_in "Name", with: @client.name
    fill_in "Subdivision", with: @client.subdivision
    click_on "Update Client"

    assert_text "Client foi atualizado com sucesso"
    click_on "Back"
  end

  test "should destroy Client" do
    visit client_url(@client)
    click_on "Destroy this client", match: :first

    assert_text "Client foi excluído com sucesso"
  end
end
