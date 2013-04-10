class Account::SettingsController < ApplicationController

  before_filter :authenticate!

  def index
    render 'account/settings'
  end

  # Update the password
  def change_password

  end

  # Update the email
  def change_email

  end

  # Delete the users account (this requires password confirmation)
  def delete
    confirmed = !! @user.authenticate(params[:password])

    if confirmed
      @user.destroy
      @alerts.push :success => 'account.settings.delete.success'
      reset_session
      redirect_to '/'
    else
      @alerts.push :notice => 'account.settings.delete.failed'
      redirect_to action: :index
    end
  end

end
