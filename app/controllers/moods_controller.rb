class MoodsController < ApplicationController

  def new
    @mood = Mood.new
  end

  def create
    @mood = current_user.moods.build(mood_params)
    @mood.day = Date.today

    if @mood.save
      render json: { status: 'success', message: 'Mood saved!', mood_name: @mood.name }
    else
      # Mood save failed, respond with JSON data
      render json: { status: 'error', message: 'Mood not saved' }
    end
  end



  ##########################
  private
  def mood_params
    params.require(:mood).permit(:name)
  end
end
