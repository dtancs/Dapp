require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:chershen)
  end

  test "should get index" do
    log_in_as(@user, remember_me: '1')
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: "testuser@test.com", name: "Test User",password: "foobar", password_confirmation: "foobar" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user, remember_me: '1')
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    log_in_as(@user, remember_me: '1')
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name,password: "foobar", password_confirmation: "foobar" } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
