require "test_helper"

class ChoiceTest < ActiveSupport::TestCase
  def setup
    @choice_one = choices(:one)
    @choice_two = choices(:two)
    @situation_one = situations(:sit_one)
    @situation_two = situations(:sit_two)

    @situation_choice_one = situation_choices(:situation_choice_one)
    @situation_choice_two = situation_choices(:situation_choice_two)
  end

  test "choice should have correct situations associated" do
    assert_includes @choice_one.situations, @situation_one
    assert_not_includes @choice_two.situations, @situation_two
  end
end
