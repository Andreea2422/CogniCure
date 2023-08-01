require "test_helper"

class MoodTest < ActiveSupport::TestCase
  def setup
    # @user = users(:michael)
    # @mood = @user.moods.build(name: "Mood Example",
    #                           day: "2023-07-31",
    #                           description: "Description Example")
    @mood = moods(:anxious)

  end

  test "should be valid" do
    assert @mood.valid?
  end

  test "user id should be present" do
    @mood.user_id = nil
    assert_not @mood.valid?
  end

  test "name should be present" do
    @mood.name = " "
    assert_not @mood.valid?
  end

  test "day should be present" do
    @mood.day = "   "
    assert_not @mood.valid?
  end
end
