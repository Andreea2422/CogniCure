require "test_helper"

class MoodsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:other_doc)
    @mood = moods(:anxious)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Mood.count' do
      post moods_path, params: { mood: {     name: "MyString",
                                             day: "2023-07-01",
                                             description: "MyString" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect update when logged in as wrong doctor" do
    log_in_as(@other_user)
    patch mood_path(@mood), params: { mood: {   name: @mood.name,
                                                day: @mood.day,
                                                description: @mood.description } }
    assert flash.empty?
    assert_redirected_to root_url
  end

end
