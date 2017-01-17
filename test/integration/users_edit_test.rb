require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
     @user = User.create(name: "Example User", email: "admin@admin.com", password: "foobar", password_confirmation: "foobar") 
     get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: @user.password } }  
     
  end
  test "  successful edit" do
    get edit_user_path(@user)
        name  = "Foo Bar"
    patch user_path(@user), params: { user: { name:  name,
                                              email: "foo@invalid.com",
                                              password:              @user.password,
                                              password_confirmation: @user.password} }

   @user.reload
    assert_equal name,  @user.name
  end
  test "unsuccessful edit" do
    
    get edit_user_path(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    
    @user.reload
    assert_not_equal name,  @user.name
    assert_not_equal email, @user.email
  end
end
