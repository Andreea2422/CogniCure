class StaticPagesController < ApplicationController
  def home
    @home_page = true
  end

  def help
  end

  def about
  end

  def contact
  end

  def discover

  end

  def learn_more_about_yourself
    @articles = Article.all
  end

  def article
    @article = Article.find(params[:id])
  end

  def quizzes
  end

  def quiz1
  end

end
