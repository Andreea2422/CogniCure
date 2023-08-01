class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :appointments, :choice_game, :progress]
  before_action :correct_user, only: [:show, :edit, :update, :appointments, :choice_game, :progress]

  def index
    doctors = User.where(doctor: true).order(name: :asc)
    @filtered_doctors = []
    # Check if the filter parameter is present in params and split it into an array if it is
    if params[:filter].present? && params[:filter].is_a?(Array)
      filters = params[:filter]
    else
      filters = []  # If the filter parameter is not present, initialize an empty array
    end

    specialities = []
    doctors.each do |doctor|
      doctor_info = Info.joins(:user).find_by(infos: {user_id: doctor.id})
      if doctor_info
        doctor_info.speciality.each do |sp|
          specialities << sp
        end
      end
    end
    @uniq_specialities = specialities.uniq

    if filters.empty?
      @filtered_doctors = doctors
    else
      # doctors.each do |doctor|
      #   doctor_info = Info.joins(:user).find_by(infos: {user_id: doctor.id})
      #   if doctor_info and filters.any? {|spec| doctor_info.speciality.include?(spec)}
      #     @filtered_doctors << doctor
      #   end
      # end
      @filtered_doctors = doctors.joins(:info).where("infos.speciality @> ARRAY[?]::varchar[]", filters)
    end

    # debugger
    @filtered_doctors = @filtered_doctors.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html do
        render 'users/index'
      end
      format.json do
        puts 'JSON request received'
        render json: {
          filtering: render_to_string(partial: 'doctors', formats: :html, layout: false, locals: { doctors: @filtered_doctors } )
          # pagination: render_to_string(partial: 'will_paginate', formats: :html, layout: false, locals: { collection: @filtered_doctors } )
        }
      end
    end

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
    @user.doctor = params[:doctor]
    respond_to do |format|
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the app!"

        format.html { redirect_to @user }
        format.json { render json: { redirect_to: user_path(@user) } } # JSON response with redirect URL
      else
        format.html { render 'new' } # Render the 'new' template for regular HTML request
        format.json { render json: @user.errors, status: :unprocessable_entity } # JSON response with errors
      end
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

  def choice_game
    @user = User.find(params[:id])
    selected_choice_id = params[:selectedChoice]

    today_mood = @user.moods.order(day: :desc).first
    if session[:execute_once].nil? || session[:execute_once] == true
      if today_mood.day.eql?(Date.current)
        if today_mood.name.eql?("furious") || today_mood.name.eql?("bitter") || today_mood.name.eql?("frustrated") || today_mood.name.eql?("annoyed")
          cod_mood = 1
        elsif today_mood.name.eql?("depressed") || today_mood.name.eql?("lonely") || today_mood.name.eql?("disappointed") || today_mood.name.eql?("sad")
          cod_mood = 2
        elsif today_mood.name.eql?("afraid") || today_mood.name.eql?("stressed") || today_mood.name.eql?("anxious") || today_mood.name.eql?("nervous")
          cod_mood = 3
        end
      else
        cod_mood = (rand(3)) + 1
      end
      # Store @cod_mood in the session
      session[:cod_mood] = cod_mood
      session[:execute_once] = false
    end

    situations = Situation.where(id_mood: session[:cod_mood])
    @choices = Choice.where(id_mood: session[:cod_mood])
    @situation_choices = SituationChoice.where(situation_id: situations.first.id..situations.last.id)

    # Get the next situation based on the selected choice
    # Look for choice_id where outcome=false
    if selected_choice_id
      find_next = SituationChoice.find_by(choice_id: selected_choice_id, outcome: false)
      @next_situation = Situation.find_by(id: find_next.situation_id)
    end

    if @next_situation
      @situation = @next_situation
    else
      # Handle the case where there's no next situation (e.g., start game)
      @situation = situations.first
    end

    respond_to do |format|
      format.html # Regular HTML response (not used in this case)
      format.json do
        # Return the new situation and choices in JSON format
        render json: {
          situation: render_to_string(partial: 'situations/situation', formats: :html, layout: false, locals: { situation: @situation }),
          choice: render_to_string(partial: 'choices/choices', formats: :html, layout: false, locals: { situation_choices: @situation_choices, situation: @situation, choices: @choices })
        }
      end
    end

    # @situation_choices.each do |sit|
    #   puts sit.situation_id
    # end
    # debugger
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
    # debugger
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


  ##########################
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Before filters
  #
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url, status: :see_other) unless current_user?(@user)
  end

  # # Confirms an admin user.
  # def admin_user
  #   redirect_to(root_url, status: :see_other) unless current_user.admin?
  # end

end
