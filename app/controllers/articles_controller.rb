class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @keywords = ['Anxiety', 'Addiction', 'ADHD', 'Bipolar Disorder', 'Breathing techniques',
                 'Cognitive Behavioral Therapy', 'Counselling', 'Depression', 'Eating disorders',
                 'Emotional Intelligence', 'Empathy', 'Food guilt', 'Grief', 'Happiness', 'Loneliness',
                 'Meditation', 'Mental Health', 'Mindfulness', 'Obsessive Compulsive Disorder', 'Online bullying',
                 'Personal growth', 'PTSD', 'Self love', 'Social anxiety', 'Stress', 'Techniques to use', 'Therapy']
  end

  def create
    @article = current_user.articles.build(article_params)
    if params[:article][:cover_image].present?
      @article.cover_image.attach(params[:article][:cover_image])
    end
    @article.publish_date = Date.today

    # Get the array of keywords, and save them to the article
    selected_keywords = params[:article][:keywords]
    @article.keywords = selected_keywords

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
