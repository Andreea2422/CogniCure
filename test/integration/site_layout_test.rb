require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", discover_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get signup_path
    assert_select "h1", "Sign up"
    assert_select "a[href=?]", login_path
    get login_path
    assert_select "h1", "Log in"
    log_in_as(@user)
    assert_redirected_to @user
    follow_redirect!
    assert_select "h1", "Hi, " + @user.name + " !"
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", discover_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", logout_path
  end
end
