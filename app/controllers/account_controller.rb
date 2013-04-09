class AccountController < ApplicationController

  # Allow a user to login by loading a user with a given username and password.
  # Upon a successfull login the user_id will be stored in the session
  def login
    return redirect_to '/' if @user
    return if ! request.post?

    # Attempt authentication if credentials were posted
    @user  = User.authenticate params[:email], params[:password]
    @email = params[:email]

    # Store the user to be loaded for each request
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
      return
    end

    # Authentication failed for the user, bummer
    @alerts.push :error => 'account.login_failed'
  end

  # Allow the user to register a new account
  def register
    return redirect_to '/' if @user
    return if ! request.post?

    @new_user = User.new params.slice(:email, :password, :password_confirmation)

    if @new_user.save
      @alerts.push :success => 'account.register_success'
      redirect_to :action => 'login'
      return
    end

    @alerts.push :error => 'account.register_failed'
  end

  # Destroy the users current session and send them home
  def logout
    reset_session
    redirect_to '/'
  end

end
