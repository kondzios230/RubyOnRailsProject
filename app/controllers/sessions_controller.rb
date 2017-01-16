class SessionsController < ApplicationController
  def new
  end

  #Method authenticate user
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
     flash.now[:danger] = 'Wystąpił problem podczas logowania, sprawdź dane' 
     render 'new'
    end
  end

  #Method for log-off
  def destroy
    log_out
    redirect_to root_url
  end
end
