class ArticlesController < ApplicationController
  before_action :doctor_user, only: [:create, :edit, :update]
  before_action :correct_doctor, only: [:create, :edit, :update]

  def show
    @shadow = true
    @article = Article.find(params[:id])

    learn_more_about_yourself = ['Counselling','Emotional Intelligence', 'Empathy', 'Happiness', 'Loneliness',
                                 'Meditation', 'Mindfulness', 'Personal Growth', 'Self Love']
    techniques_to_use = ['Breathing Techniques', 'Techniques To Use']
    mental_health = ['Anxiety', 'Addiction', 'ADHD', 'Bipolar Disorder','Cognitive Behavioral Therapy', 'Depression', 'Eating Disorders',
                     'Food Guilt', 'Grief', 'Mental Health', 'Obsessive Compulsive Disorder', 'Online Bullying', 'PTSD',
                     'Social Anxiety', 'Stress', 'Therapy']

    if learn_more_about_yourself.include?(@article.keywords.first)
      @path_active = "Self-Growth"
      @path_title = "Learn more about yourself"
      @path = yourself_path
    elsif techniques_to_use.include?(@article.keywords.first)
      @path_active = ""
      @path_title = "Techniques To Use"
      # @path = mental_path
    elsif mental_health.include?(@article.keywords.first)
      @path_active = "Mental Health"
      @path_title = "Mental Illnesses"
      @path = mental_path
    end

  end

  def new
    @article = Article.new
    @keywords = ['Anxiety', 'Addiction', 'ADHD', 'Bipolar Disorder', 'Breathing Techniques',
                 'Cognitive Behavioral Therapy', 'Counselling', 'Depression', 'Eating Disorders',
                 'Emotional Intelligence', 'Empathy', 'Food Guilt', 'Grief', 'Happiness', 'Loneliness',
                 'Meditation', 'Mental Health', 'Mindfulness', 'Obsessive Compulsive Disorder', 'Online Bullying',
                 'Personal Growth', 'PTSD', 'Self Love', 'Social Anxiety', 'Stress', 'Techniques To Use', 'Therapy']
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

  def edit
    @article = Article.find(params[:id])
    @all_keywords = ['Anxiety', 'Addiction', 'ADHD', 'Bipolar Disorder', 'Breathing Techniques',
                     'Cognitive Behavioral Therapy', 'Counselling', 'Depression', 'Eating Disorders',
                     'Emotional Intelligence', 'Empathy', 'Food Guilt', 'Grief', 'Happiness', 'Loneliness',
                     'Meditation', 'Mental Health', 'Mindfulness', 'Obsessive Compulsive Disorder', 'Online Bullying',
                     'Personal Growth', 'PTSD', 'Self Love', 'Social Anxiety', 'Stress', 'Techniques To Use', 'Therapy']
    @article_keywords = @article.keywords
  end

  def update
    @article = Article.find(params[:id])

    if params[:article][:cover_image].present?
      @article.cover_image.attach(params[:article][:cover_image])
    end

    # Get the array of keywords, and save them to the article
    selected_keywords = params[:article][:keywords]
    @article.keywords = selected_keywords

    if @article.update(article_params)
      # Handle a successful update.
      flash[:success] = "Article updated"
      redirect_to show_article_path
    else
      render 'articles/edit'
    end
  end

  def destroy
  end

  ##########################
  private
  def article_params
    params.require(:article).permit(:title, :description, :cover_image, :readtime, :content, :quote)
  end

  def doctor_user
    redirect_to(root_url, status: :see_other) unless logged_in? && current_user.doctor?
  end

  def correct_doctor
    @article = Article.find(params[:id])
    @doctor = User.find(@article.user_id)
    redirect_to(root_url, status: :see_other) unless current_user?(@doctor)
  end
end
