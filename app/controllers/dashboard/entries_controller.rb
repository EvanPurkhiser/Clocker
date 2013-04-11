class Dashboard::EntriesController < DashboardController

  # Load the project from the passed project id
  before_filter { @project = @user.projects.find(params[:project]) }

  # List all uninvoiced and complete entries
  def list
    @entries = @project.entries.uninvoiced.complete.in_order.all
  end

end
