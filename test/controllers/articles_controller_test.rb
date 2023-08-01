require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @doctor = users(:hailey)
    @other_doc = users(:other_doc)
    @article = articles(:article)
    @another_article = articles(:another_article)
  end

  test "should get an article" do
    get show_article_path(@article)
    assert_response :success
  end

  test "should redirect edit when logged in user not doctor" do
    log_in_as(@user)
    get edit_article_path(@article)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in user not doctor" do
    log_in_as(@user)
    patch article_path(@article), params: { article: {   title: @article.title,
                                                         description: @article.description,
                                                         publish_date: @article.publish_date,
                                                         readtime: @article.readtime,
                                                         content: @article.content,
                                                         quote: @article.quote,
                                                         keywords: @article.keywords } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: {   title: "lorem ipsum",
                                                description: "lorem ipsum",
                                                publish_date: "2023-05-05",
                                                readtime: "5 min read",
                                                content: "lorem ipsum",
                                                quote: "lorem ipsum",
                                                keywords: %w[Counselling keyword2] } }
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when logged in as wrong doctor" do
    log_in_as(@other_doc)
    get edit_article_path(@article)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong doctor" do
    log_in_as(@other_doc)
    patch article_path(@article), params: {
        article: {   title: @article.title,
                     description: @article.description,
                     publish_date: @article.publish_date,
                     readtime: @article.readtime,
                     content: @article.content,
                     quote: @article.quote,
                     keywords: @article.keywords } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "article as non-doctor" do
    log_in_as(@user)
    get show_article_path(@article)
    assert_select 'a', text: 'Edit', count: 0
  end

  test "article as wrong doctor" do
    log_in_as(@doctor)
    get show_article_path(@another_article)
    assert_select 'a', text: 'Edit', count: 0
  end

end
