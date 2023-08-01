require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  def setup
    @doctor = users(:hailey)
    @article = @doctor.articles.build(title: "Title Example",
                           description: "Title Example",
                           publish_date: "2023-07-13",
                           readtime: "5 min read",
                           content: "Content Example",
                           quote: "Quote Example",
                           keywords: %w[keyword1 keyword2 keyword3]
                           )

  end

  test "should be valid" do
    assert @article.valid?
  end

  test "user id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end

  test "content should be present" do
    @article.content = "   "
    assert_not @article.valid?
  end

  test "title should be present" do
    @article.title = "   "
    assert_not @article.valid?
  end

  test "description should be present" do
    @article.description = "   "
    assert_not @article.valid?
  end

  test "readtime should be present" do
    @article.readtime = "   "
    assert_not @article.valid?
  end

  test "keywords should be present" do
    @article.keywords = []
    assert_not @article.valid?
  end

  test "order should be most recent first" do
    assert_equal articles(:most_recent), Article.first
  end

end
