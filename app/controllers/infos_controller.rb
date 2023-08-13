class InfosController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update]
  before_action :doctor_user, only: [:new, :create, :edit, :update]
  before_action :correct_user, only: [:new, :edit]

  def new
    @info = Info.new
  end

  def show
    @user = User.find(params[:id])
    @user_info = Info.joins(:user).find_by(infos: {user_id: @user.id})
  end

  def create
    # Check if the current_user already has an associated Info record
    if current_user.info.nil?
      # If not, create a new Info record for the current_user
      @info = current_user.build_info
    else
      # If there's already an associated Info record, use it
      @info = current_user.info
    end

    # debugger
    @info.speciality = process_array_params(params[:info][:speciality])
    @info.contact = process_array_params(params[:info][:contact])

    # debugger
    if @info.save
      flash[:success] = "Details created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    # debugger
    @user_info = Info.joins(:user).find_by(infos: {user_id: params[:id]})

  end

  def update
    @user_info = Info.joins(:user).find_by(infos: {user_id: current_user.id})

    @user_info.speciality = process_array_params(params[:info][:speciality])
    @user_info.contact = process_array_params(params[:info][:contact])

    if @user_info.update(info_params)
      # Handle a successful update.
      flash[:success] = "Details updated"
      redirect_to current_user
    else
      render 'infos/edit'
    end
  end


  ##########################
  private
  def info_params
    params.require(:info).permit(:biography, :experience)
  end

  def process_array_params(string)
    string.split(',').map(&:strip)
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

  def doctor_user
    redirect_to(root_url, status: :see_other) unless current_user.doctor?
  end
end
