class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

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
      render 'edit'
    end
  end

  def progress
    @start_date = Date.new(2023, 5, 1)
    # @start_date = Date.today.beginning_of_week(:monday)
    @start_date_month = Date.new(2023, 5, 1).beginning_of_month
    @end_date = Date.new(2023, 5, 7)
    # @end_date = Date.today.end_of_week(:sunday)
    @end_date_month = @start_date_month.end_of_month

    @user = User.find(params[:id])
    @all_moods = @user.moods

    @moods_week = @all_moods.where(day: @start_date..@end_date).order(:day)
    @moods_month = @all_moods.where(day: @start_date_month..@end_date_month).order(:day)
    # @mood_data = @moods.map { |day, name| [day.strftime("%d-%m-%Y"), name] }

    @moods_ord = @user.moods.order(:day)

    @mood_data_week = []
    @mood_data_month = []
    # @simple_mood_data = []
    # @moods_ord.each do |mood|
    #   @mood_data << { name: mood.day.strftime("%Y-%m-%d"), data: [[mood.day, mood.name]] }
    # end

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
      # @simple_mood_data << [@day, @name]
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
    render 'my_progress'

  end

  ##########################
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
