class ApplicationController < ActionController::Base

  layout 'base'

  before_filter :load_user, :load_alerts
  after_filter  :flash_alerts

  protected

    # Set the user attribute to the currently logged in user if they're currently
    # logged in. If not set the user attribute to false
    def load_user
      @user = User.find(session[:user_id]) rescue false
    end

    # Load alerts from the previous request
    def load_alerts
       @alerts = session[:alerts] || []
    end

    # Flash the current alerts to the session
    def flash_alerts
        session[:alerts] = @alerts
    end

    # If we render then assume the alerts have been seen and clear them
    def render(*args)
      super
      @alerts = []
    end

    # Handle authentication checking, redirect them to the login with an alert
    # if they need to login to access the page
    def authenticate!
      return if @user

      @alerts.push :warning => 'account.login.required'
      redirect_to '/account/login'
      false
    end

end
