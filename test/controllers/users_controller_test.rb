require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
       def setup
     @user = User.create(name: "Example User", email: "admin@admin.com", password: "foobar", password_confirmation: "foobar")   
     @other_user = User.create(name: "RandomUser", email: "user@random.com", password: "foobar",password_confirmation: "foobar")  
     
  end
 test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  
   test "should redirect edit when logged in as wrong user" do
     get login_path
    post login_path, params: { session: { email:    @other_user.email,
                                          password: @other_user.password } }
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end
test "should not allow the admin attribute to be edited via the web" do
    get login_path
    post login_path, params: { session: { email:    @other_user.email,
                                          password: @other_user.password } }
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                    user: { password:              @other_user.password,
                                            password_confirmation:  @other_user.password,
                                            admin: true } }
    assert_not @other_user.admin?
  end
    test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

end
