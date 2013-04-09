class Dashboard::ProjectsController < ApplicationController

  def list
    @projects = @user.projects.all
  end

  def new
    return if ! request.post?

    @project = @user.projects.new params[:project]

    if ! @project.save
      @alerts << { :error => 'projects.new.error'}
      return
    end

    @alerts << { :success => 'projects.new.saved' }
    redirect_to '/'
  end

end
