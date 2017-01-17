class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  #Method returns paginated list of users
  def index
    @users = User.paginate(page: params[:page])
  end

  #Method creates empty user
  def new
    @user = User.new
  end

  #Method finds user by given id
  def show
    @user = User.find(params[:id])
  end

  #Method creates user from params and saves it
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Witaj na naszym portalu!"
      redirect_to @user
    else
      render 'new'
    end
  end

  #Method updates user
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
      flash[:success] = "Profil zaktualizowany!"
      redirect_to @user
    else
      render 'edit'
    end
  end
   
  #Method destroys user
  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "Użytkownik usunięty"
    redirect_to users_url
  end

  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?        
        store_location
        flash[:danger] = "Zaloguj się!"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def admin_user
      redirect_to(root_url) unless (logged_in? && current_user.admin?)
    end
end
