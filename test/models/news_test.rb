require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  def setup
     @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")   
    @news = News.new(content: "Lorem ipsum",title:" ss", user_id: 1)
  end


  test "user id should be present" do
    @news.user_id = nil
    assert_not @news.valid?
  end

  test "content should be present" do
    @news.content = "   "
    assert_not @news.valid?
  end
 test "title should be present" do
    @news.title = "   "
    assert_not @news.valid?
  end
  test "title should be at most 140 characters" do
    @news.content = "a" * 141
    assert_not @news.valid?
  end
end
