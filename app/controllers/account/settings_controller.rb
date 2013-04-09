class Account::SettingsController < ApplicationController

  before_filter :authenticate!

  # Always render the
  before_filter { render 'account/settings' }

  def index; end

  # Update the password
  def change_password

  end

  # Update the email
  def change_email

  end

  # Delete the users account (this requires password confirmation)
  def delete

  end

end
