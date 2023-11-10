require "test_helper"

class ProyectUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proyect_user = proyect_users(:one)
  end

  test "should get index" do
    get proyect_users_url
    assert_response :success
  end

  test "should get new" do
    get new_proyect_user_url
    assert_response :success
  end

  test "should create proyect_user" do
    assert_difference("ProyectUser.count") do
      post proyect_users_url, params: { proyect_user: {  } }
    end

    assert_redirected_to proyect_user_url(ProyectUser.last)
  end

  test "should show proyect_user" do
    get proyect_user_url(@proyect_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_proyect_user_url(@proyect_user)
    assert_response :success
  end

  test "should update proyect_user" do
    patch proyect_user_url(@proyect_user), params: { proyect_user: {  } }
    assert_redirected_to proyect_user_url(@proyect_user)
  end

  test "should destroy proyect_user" do
    assert_difference("ProyectUser.count", -1) do
      delete proyect_user_url(@proyect_user)
    end

    assert_redirected_to proyect_users_url
  end
end
