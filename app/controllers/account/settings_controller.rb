class Account::SettingsController < ApplicationController

  before_filter :authenticate!
  before_filter { @confirmed = !! @user.authenticate(params[:password_confirm]) }

  def index
    render 'account/settings'
  end

  # Update the email
  def change_email
    update_account :email
  end

  # Update the password
  def change_password
    update_account :password
  end

  # Delete the users account (this requires password confirmation)
  def delete
    if ! @confirmed
      @alerts.push :notice => 'account.settings.delete.failed'
      redirect_to action: :index
      return
    end

    @user.destroy
    @alerts.push :success => 'account.settings.delete.success'
    reset_session
    redirect_to '/'
  end

  private

    # Update a single attribute on the current user, requiring that the user
    # has passed their current password to confirum the change
    def update_account(attribute)
      if ! @confirmed
        @alerts.push :error => 'account.settings.confirm_failed'
        render 'account/settings'
        return
      end

      @user.send("#{attribute}=", params[attribute])

      if @user.save
        @alerts.push :success => "account.settings.#{attribute}.success"
        redirect_to action: :index
      else
        @user.reload
        @alerts.push :error => "account.settings.#{attribute}.failed"
        render 'account/settings'
      end
    end

end
