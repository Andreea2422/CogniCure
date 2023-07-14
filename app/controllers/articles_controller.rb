class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.cover_image.attach(params[:article][:cover_image])
    @article.publish_date = Date.today
    if @article.save
      flash[:success] = "Article uploaded!"
      redirect_to yourself_path
    else
      render 'new'
    end
  end

  def destroy
  end

  ##########################
  private
  def article_params
    params.require(:article).permit(:title, :description, :cover_image, :readtime, :content, :quote)
  end
end
