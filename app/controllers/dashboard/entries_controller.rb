class Dashboard::EntriesController < DashboardController

  # Load the project from the passed project id
  before_filter { @project = @user.projects.find(params[:project]) }

  # List all uninvoiced and complete entries
  def list
    @entries = @project.entries.uninvoiced.complete.in_order.all
    @pending = @project.entries.uninvoiced.pending.first

    respond_to do |format|
      format.html
      format.csv { render text: @entries.to_csv(:only => [:start_time, :end_time, :description]) }
    end
  end

  def clock_in
    @project.clock_in
    redirect_to action: :list
  end

  def clock_out
    @project.clock_out params.extract!(:description)
    redirect_to action: :list
  end

end
