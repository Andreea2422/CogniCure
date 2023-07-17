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
    @info = current_user.info.build(info_params)
    if @info.save
      flash[:success] = "Profile updated!"
      redirect_to user_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end


  ##########################
  private
  def info_params
    params.require(:info).permit(:biography, :speciality, :experience, :contact)
  end
end
