class MoodsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update]
  before_action :correct_user, only: [:update]
  def new
    @mood = Mood.new
  end

  def create
    @mood = current_user.moods.build(mood_params)
    @mood.day = Date.today
    @mood.description = " "

    if @mood.save
      render json: { status: 'success', message: 'Mood saved!', mood_name: @mood.name }
    else
      # Mood save failed, respond with JSON data
      render json: { status: 'error', message: 'Mood not saved' }
    end
  end

  def edit_partial
    mood = current_user.moods.order(day: :desc).first
    if mood.day.eql?(Date.current)
      @mood = mood
    end

    # @mood = current_user.moods.order(day: :desc).first
    render partial: 'edit', locals: { mood: @mood }
  end

  def update
    mood = current_user.moods.order(day: :desc).first
    if mood.day.eql?(Date.current)
      @mood = mood
    end

    # @mood = current_user.moods.order(day: :desc).first
    description = params[:mood][:description]
    @mood.description = description

    if @mood.update(mood_params)
      # Handle a successful update.
      redirect_to progress_user_path(current_user,date: Date.current.strftime('%Y-%m-%d'))
    else
      render partial: 'moods/edit', locals: { mood: @mood }
    end
  end


  ##########################
  private
  def mood_params
    params.require(:mood).permit(:name)
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
    @mood = Mood.find(params[:id])
    @user = User.find(@mood.user_id)
    redirect_to(root_url, status: :see_other) unless current_user?(@user)
  end
end
