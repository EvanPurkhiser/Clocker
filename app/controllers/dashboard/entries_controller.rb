class Dashboard::EntriesController < DashboardController

  # Load the project from the passed project id
  before_filter { @project = @user.projects.find(params[:project]) }

  # List all current project entries
  def list
    @entries = @project.entries.in_order.all
  end

end
