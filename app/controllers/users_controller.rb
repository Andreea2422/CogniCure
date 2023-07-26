class UsersController < ApplicationController
  def index
    @doctors = User.where(doctor: true).order(name: :asc)
  end

  def show
    @user = User.find(params[:id])
    @today = Date.current.strftime('%Y-%m-%d')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the app!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'users/edit'
    end
  end

  def appointments
    @user = User.find(params[:id])
    @appointments = @user.appointments.order(appointment_date: :asc)
    @doctor_appointments = @user.doctor_appointments.order(appointment_date: :asc)

    render 'my_appointments'
  end

  def progress
    @user = User.find(params[:id])
    @all_moods = @user.moods
    @moods_ord = @user.moods.order(:day)
    @last_mood = @moods_ord.last

    @today = params[:date]
    formatted_date = Date.parse(@today)


    @start_date_week = formatted_date.beginning_of_week
    @end_date_week = formatted_date.end_of_week
    @start_date_month = formatted_date.beginning_of_month
    @end_date_month = formatted_date.end_of_month

    @moods_week = @all_moods.where(day: @start_date_week..@end_date_week).order(:day)
    @moods_month = @all_moods.where(day: @start_date_month..@end_date_month).order(:day)

    @mood_data_week = []
    @mood_data_month = []

    @moods_week.each do |mood|
      if mood.day.monday?
        @day = "Mon"
        elsif mood.day.tuesday?
          @day = "Tue"
        elsif mood.day.wednesday?
          @day = "Wed"
        elsif mood.day.thursday?
          @day = "Thu"
        elsif mood.day.friday?
          @day = "Fri"
        elsif mood.day.saturday?
          @day = "Sat"
        elsif mood.day.sunday?
          @day = "Sun"
      end

      if mood.name.eql?"furious"
        @name = "1"
        elsif mood.name.eql?"bitter"
          @name = "2"
        elsif mood.name.eql?"frustrated"
          @name = "3"
        elsif mood.name.eql?"annoyed"
          @name = "4"
        elsif mood.name.eql?"depressed"
          @name = "5"
        elsif mood.name.eql?"lonely"
          @name = "6"
        elsif mood.name.eql?"disappointed"
          @name = "7"
        elsif mood.name.eql?"sad"
          @name = "8"
        elsif mood.name.eql?"afraid"
          @name = "9"
        elsif mood.name.eql?"stressed"
          @name = "10"
        elsif mood.name.eql?"anxious"
          @name = "11"
        elsif mood.name.eql?"nervous"
          @name = "12"
        elsif mood.name.eql?"relaxed"
          @name = "13"
        elsif mood.name.eql?"okay"
          @name = "14"
        elsif mood.name.eql?"joyful"
          @name = "15"
        elsif mood.name.eql?"loved"
          @name = "16"
      end

      @mood_data_week << { name: mood.name.capitalize, data: [[@day, @name]] }
    end

    @moods_month.each do |mood|
      if mood.name.eql?"furious"
        @name = "1"
      elsif mood.name.eql?"bitter"
        @name = "2"
      elsif mood.name.eql?"frustrated"
        @name = "3"
      elsif mood.name.eql?"annoyed"
        @name = "4"
      elsif mood.name.eql?"depressed"
        @name = "5"
      elsif mood.name.eql?"lonely"
        @name = "6"
      elsif mood.name.eql?"disappointed"
        @name = "7"
      elsif mood.name.eql?"sad"
        @name = "8"
      elsif mood.name.eql?"afraid"
        @name = "9"
      elsif mood.name.eql?"stressed"
        @name = "10"
      elsif mood.name.eql?"anxious"
        @name = "11"
      elsif mood.name.eql?"nervous"
        @name = "12"
      elsif mood.name.eql?"relaxed"
        @name = "13"
      elsif mood.name.eql?"okay"
        @name = "14"
      elsif mood.name.eql?"joyful"
        @name = "15"
      elsif mood.name.eql?"loved"
        @name = "16"
      end

      @mood_data_month << { name: mood.name.capitalize, data: [[mood.day, @name]] }
    end


    # debugger
    response_data = {
      mood_data_week: @mood_data_week,
      mood_data_month: @mood_data_month
    }

    respond_to do |format|
      format.html do
        render 'my_progress'
      end
      format.json do
        render json: response_data
      end
    end

  end


  def chat
    @user = User.find(params[:id])
  end


  ##########################
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :doctor)
  end

end
