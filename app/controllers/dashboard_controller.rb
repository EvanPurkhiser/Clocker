class DashboardController < ApplicationController

  layout 'dashboard'

  # User must be logged into
  before_filter :authenticate!

  def profile

  end

end
