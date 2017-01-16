require 'test_helper'

class ComentTest < ActiveSupport::TestCase
   def setup
     @user = User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")   
      @news = News.create(content: "Lorem ipsum",title:" ss", user_id:1)
      @com = Coment.create(content: "Lorem ipsum", news_id:1, user_id: 1)
  end

 
  test "user id should be present" do
    @com.user_id = nil
    assert_not @com.valid?
  end

  test "content should be present" do
    @com.content = "   "
    assert_not @com.valid?
  end
end
