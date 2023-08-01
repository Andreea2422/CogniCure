require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def setup
    # @user = users(:michael)
    # @doctor = users(:hailey)
    # @appointment = @user.appointments.build(patient: "Title Example",
    #                                         appointment_date: "2023-07-31",
    #                                         doctor_name: @doctor.name,
    #                                         doctor_id: @doctor.id)
    @appointment = appointments(:one)
  end

  test "should be valid" do
    assert @appointment.valid?
  end

  test "user id should be present" do
    @appointment.user_id = nil
    assert_not @appointment.valid?
  end

  test "doctor id should be present" do

    @appointment.doctor_id = nil
    assert_not @appointment.valid?
  end

  test "patient should be present" do
    @appointment.patient = "   "
    assert_not @appointment.valid?
  end

  test "date should be present" do
    @appointment.appointment_date = "   "
    assert_not @appointment.valid?
  end

end
