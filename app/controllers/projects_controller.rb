class ProjectsController < ApplicationController
    layout "projects"

    def index
      @projects = Project.all
      render :other
    end
    
    def show
        @project = Project.find_by_id(params[:id])
    end

    def something

    end

    def overdue
        #query the db for all the overdue projects
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)

        if @project.save
            redirect_to project_path(@project)
        else
            redirect_to new_project_path
        end
    end


    private

        def project_params
            params.require(:project).permit(:name, :description, :due_date)
        end
end
