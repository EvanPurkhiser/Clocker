class AccountController < ApplicationController

  # Allow a user to login by loading a user with a given username and password.
  # Upon a successfull login the user_id will be stored in the session
  def login
    # Don't let a user login if they're already logged in
    redirect_to '/' if @user

    # Attempt authentication if credentials were posted
    @user = User.authenticate params[:email], params[:password]

    # Store the user to be loaded for each request
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @alerts << {:error => 'account.login_failed'}
    end
  end

  # Destroy the users current session and send them home
  def logout
    reset_session
    redirect_to '/'
  end

  # Allow the user to register a new account
  def register
  end

end
