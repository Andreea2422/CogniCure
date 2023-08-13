require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @doctor = users(:hailey)
  end

  test "index including pagination" do
    log_in_as(@user)
    get users_path
    assert_response :success
    assert_template 'users/index'
    assert_select 'div.digg_pagination'

    user_doctors = User.where(doctor: true)
    user_doctors.paginate(page: 1, per_page: 9).each do |user|
      # puts "User ID: #{user.id}, Name: #{user.name}"
      # puts show_info_path(user)
      assert_select 'a[href=?]', show_info_path(user)
    end
  end

end
