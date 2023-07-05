class MoodsController < ApplicationController

  # def mood_chart
  #   # current_date = Date.today
  #   # start_date = current_date.beginning_of_week(:monday)
  #   # end_date = current_date.end_of_week(:sunday)
  #   start_date = Date.new(2023, 5, 1)
  #   end_date = Date.new(2023, 5, 7)
  #   user = User.find(params[:user_id])
  #   moods = user.moods.where(day: start_date..end_date).pluck(:day, :name)
  #   @mood_data = moods.map { |day, name| [day.strftime("%d-%m-%Y"), name] }
  #
  # end
end
