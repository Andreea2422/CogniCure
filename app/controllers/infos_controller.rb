class InfosController < ApplicationController
  def new
    @info = Info.new
  end

  def show
    @user = User.find(params[:id])
    @user_info = Info.joins(:user).find_by(infos: {user_id: @user.id})
    # @user_info = Info.find(params[:user_id])
    # @user = @user_info.user_id
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
    # @user = User.find(params[:id])
    @user_info = Info.joins(:user).find_by(infos: {user_id: current_user.id})

  end

  def update
    # @user = User.find(params[:id])
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

  def process_array_params(array_string)
    array_string.split(',').map(&:strip)
  end
end
