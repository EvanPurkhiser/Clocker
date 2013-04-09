class Dashboard::ProjectsController < ApplicationController

  def list
    @projects = @user.projects.all
  end

  def new
    return if ! request.post?

    @project = @user.projects.new params[:project]

    if ! @project.save
      @alerts.push :error => 'projects.new.error'
      return
    end

    @alerts.push :success => 'projects.new.saved', :name => @project.name
    redirect_to '/'
  end

end
