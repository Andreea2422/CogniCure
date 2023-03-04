class StaticPagesController < ApplicationController
  def home
    @home_page = true
  end

  def help
  end
end
