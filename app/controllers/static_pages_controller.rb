class StaticPagesController < ApplicationController
  def home
    # @home_page = true
  end

  def help
  end

  def about
  end

  def contact
  end

  def discover
    @discover_page = true
    @shadow = true
    @search_query = params[:keyword] #&.downcase # Downcase the search query if it's not nil

    # Then redirect to the appropriate page based on the search query
    if @search_query.present?
      redirect_to static_keyword_path(@search_query)
    # else
    #   redirect_to not_found_path
    end
  end

  def keyword
    @search_query = params[:keyword] #.titleize
    @articles = find_articles(params[:keyword])
  end

  def learn_more_about_yourself
    all_articles = []
    Article.selfgrowth.each do |tag|
      mh_articles = find_articles(tag)
      all_articles = all_articles|mh_articles
    end
    all_articles.sort_by! {|article| article.publish_date }
    @articles = all_articles.reverse!
  end

  def mental_health
    all_articles = []
    Article.mentalhealth.each do |tag|
      mh_articles = find_articles(tag)
      all_articles = all_articles|mh_articles
    end
    all_articles.sort_by! {|article| article.publish_date }
    @articles = all_articles.reverse!
  end

  def quizzes
  end

  def quiz1
  end

  ##########################
  private
  def find_articles(keyword)
    # Query all articles from the database
    articles = Article.all

    # Filter articles to only include those where 'keywords' array contains the search query
    articles.select { |article| article.keywords.include?(keyword) }
  end

end
