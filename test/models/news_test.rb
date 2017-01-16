require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @news = @user.news.build(content: "Lorem ipsum")
  end


  test "user id should be present" do
     @news.user_id = nil
    assert_not @news.valid?
  end
end
