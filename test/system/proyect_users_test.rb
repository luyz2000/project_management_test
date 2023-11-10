require "application_system_test_case"

class ProyectUsersTest < ApplicationSystemTestCase
  setup do
    @proyect_user = proyect_users(:one)
  end

  test "visiting the index" do
    visit proyect_users_url
    assert_selector "h1", text: "Proyect users"
  end

  test "should create proyect user" do
    visit proyect_users_url
    click_on "New proyect user"

    click_on "Create Proyect user"

    assert_text "Proyect user was successfully created"
    click_on "Back"
  end

  test "should update Proyect user" do
    visit proyect_user_url(@proyect_user)
    click_on "Edit this proyect user", match: :first

    click_on "Update Proyect user"

    assert_text "Proyect user was successfully updated"
    click_on "Back"
  end

  test "should destroy Proyect user" do
    visit proyect_user_url(@proyect_user)
    click_on "Destroy this proyect user", match: :first

    assert_text "Proyect user was successfully destroyed"
  end
end
