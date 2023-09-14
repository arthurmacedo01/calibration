require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test "visiting the index" do
    visit sections_url
    assert_selector "h1", text: "Sections"
  end

  test "should create section" do
    visit sections_url
    click_on "New section"

    fill_in "Acronym", with: @section.acronym
    fill_in "Name", with: @section.name
    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back"
  end

  test "should update Section" do
    visit section_url(@section)
    click_on "Edit this section", match: :first

    fill_in "Acronym", with: @section.acronym
    fill_in "Name", with: @section.name
    click_on "Update Section"

    assert_text "Section foi atualizado com sucesso"
    click_on "Back"
  end

  test "should destroy Section" do
    visit section_url(@section)
    click_on "Destroy this section", match: :first

    assert_text "Section foi excluído com sucesso"
  end
end
