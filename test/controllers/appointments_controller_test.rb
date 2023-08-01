require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @doctor = users(:hailey)
    @appointment = appointments(:one)
  end


  test "should redirect create when not logged in" do
    assert_no_difference 'Appointment.count' do
      post appointments_path, params: { appointment: {     patient: "MyString",
                                                           appointment_date: "2023-07-15",
                                                           doctor_name: @doctor.name,
                                                           doctor_id: @doctor.id } }
    end
    assert_redirected_to login_url
  end

end
