require "test_helper"

class InfosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @doctor = users(:hailey)
    @other_doc = users(:other_doc)
    @info_hailey = infos(:info_hailey)
  end

  test "should get an article" do
    get show_info_path(@doctor)
    assert_response :success
  end

  test "should redirect edit when logged in user not doctor" do
    log_in_as(@user)
    get edit_info_path(@doctor)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Info.count' do
      post infos_path, params: { info: {   biography: "MyText",
                                           speciality: %w[Psychology k2 k3],
                                           experience: "MyString",
                                           contact: %w[0145 k2 k3] } }
    end
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong doctor" do
    log_in_as(@other_doc)
    get edit_info_path(@doctor)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong doctor" do
    log_in_as(@other_doc)
    patch info_path(@doctor), params: { info: {   biography: @info_hailey.biography,
                                                  speciality: @info_hailey.speciality,
                                                  experience: @info_hailey.experience,
                                                  contact: @info_hailey.contact } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "info as non-doctor" do
    log_in_as(@user)
    get show_info_path(@doctor)
    assert_select 'a', text: 'Edit', count: 0
  end

  test "info as wrong doctor" do
    log_in_as(@other_doc)
    get show_info_path(@doctor)
    assert_select 'a', text: 'Edit', count: 0
  end
end
