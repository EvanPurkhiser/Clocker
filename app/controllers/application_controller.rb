class ApplicationController < ActionController::Base

  layout 'layouts/base'
  before_filter :load_user

  protected

    # Set the user attribute to the currently logged in user if they're currently
    # logged in. If not set the user attribute to false
    def load_user
      @user = User.find(session[:user_id]) rescue false
    end

end
