require "test_helper"

class SituationTest < ActiveSupport::TestCase
  def setup
    @situation = situations(:sit_one)
    @choice_one = choices(:one)
    @choice_two = choices(:two)

    # Create situation choices to establish the many-to-many relationship
    @situation_choice_one = situation_choices(:situation_choice_one)
    @situation_choice_two = situation_choices(:situation_choice_two)
  end

  test "situation should have correct choices associated" do
    assert_includes @situation.choices, @choice_one
    assert_includes @situation.choices, @choice_two
  end
end
