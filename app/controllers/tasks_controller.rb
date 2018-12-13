class TasksController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @project.tasks.build(task_params)

    if @project.save

    else

    end
  end


  private


end
