class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      # remember_helper user
      params[:session][:remember_me] == '1' ? remember_helper(user) : forget(user)
      redirect_to user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'sessions/new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
