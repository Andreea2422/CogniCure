require "test_helper"

class InfoTest < ActiveSupport::TestCase
  def setup
    # @doctor = users(:hailey)
    # @info = @doctor.build_info(biography: "Title Example",
    #                            speciality: %w[keyword1 keyword2 keyword3],
    #                            experience: "22 years",
    #                            contact: %w[keyword11 keyword22 keyword33])

    @info = infos(:info_hailey)
  end

  test "should be valid" do
    assert @info.valid?
  end

  test "user id should be present" do
    @info.user_id = nil
    assert_not @info.valid?
  end

  test "biography should be present" do
    @info.biography = " "
    assert_not @info.valid?
  end

  test "speciality should be present" do
    @info.speciality = []
    assert_not @info.valid?
  end

  test "experience should be present" do
    @info.experience = " "
    assert_not @info.valid?
  end

  test "contact should be present" do
    @info.contact = []
    assert_not @info.valid?
  end


end
