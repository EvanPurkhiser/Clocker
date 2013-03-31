class AccountController < ApplicationController

  # Allow a user to login by loading a user with a given username and password.
  # Upon a successfull login the user_id will be stored in the session
  def login
    return redirect_to '/' if @user

    # Don't do anything if they aren't trying to login
    return if ! request.post?

    # Attempt authentication if credentials were posted
    @user  = User.authenticate params[:email], params[:password]
    @email = params[:email]

    # Store the user to be loaded for each request
    if @user
      session[:user_id] = @user.id
      return redirect_to '/'
    end

    # Authentication failed for the user, bummer
    @alerts << {:error => 'account.login_failed'}
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
