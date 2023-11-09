require "application_system_test_case"

class ProyectsTest < ApplicationSystemTestCase
  setup do
    @proyect = proyects(:one)
  end

  test "visiting the index" do
    visit proyects_url
    assert_selector "h1", text: "Proyects"
  end

  test "should create proyect" do
    visit proyects_url
    click_on "New proyect"

    fill_in "Description", with: @proyect.description
    fill_in "Slug", with: @proyect.slug
    fill_in "Status", with: @proyect.status
    fill_in "Title", with: @proyect.title
    click_on "Create Proyect"

    assert_text "Proyect was successfully created"
    click_on "Back"
  end

  test "should update Proyect" do
    visit proyect_url(@proyect)
    click_on "Edit this proyect", match: :first

    fill_in "Description", with: @proyect.description
    fill_in "Slug", with: @proyect.slug
    fill_in "Status", with: @proyect.status
    fill_in "Title", with: @proyect.title
    click_on "Update Proyect"

    assert_text "Proyect was successfully updated"
    click_on "Back"
  end

  test "should destroy Proyect" do
    visit proyect_url(@proyect)
    click_on "Destroy this proyect", match: :first

    assert_text "Proyect was successfully destroyed"
  end
end
