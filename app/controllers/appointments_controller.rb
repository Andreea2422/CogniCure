class AppointmentsController < ApplicationController
  def new
    @doctors = User.where(doctor: true)
    @appointment = Appointment.new

    @all_appointments = Appointment.all

    @tomorrow = Date.tomorrow
  end

  def create
    # appointment_params_timestamp = appointment_params
    #                                  .merge(appointment_date: convert_to_timestamp(appointment_params[:appointment_date]))

    @appointment = current_user.appointments.build(appointment_params)

    if @appointment.save
      flash[:success] = "Appointment saved!"
      redirect_to book_appointment_path
    else
      render 'new'
    end
  end

  ##########################
  private
  def appointment_params
    params.require(:appointment).permit(:patient, :appointment_date, :doctor_name, :doctor_id)
  end

  def convert_to_timestamp(datetime_string)
    datetime = DateTime.parse(datetime_string)
    datetime.strftime('%Y-%m-%d %H:%M:%S')
  end

end
