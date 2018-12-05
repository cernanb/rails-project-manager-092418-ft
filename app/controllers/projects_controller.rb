class ProjectsController < ApplicationController
    layout "projects"
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      @projects = Project.all
    end
    
    def show
    end

    def something

    end

    def destroy
        @project.delete

        redirect_to projects_path
    end

    def overdue
        #query the db for all the overdue projects
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)

        # @project.tasks.build
        binding.pry

        if @project.save
            redirect_to project_path(@project)
        else
            redirect_to new_project_path
        end
    end

    def edit
    end
    
    def update
        @project.update(project_params)
        redirect_to project_path(@project)
    end
    
    
    private
    def notify_user
        Send eia
    end
    def set_project
        @project = Project.find_by(id: params[:id])
    end
        def project_params
            params.require(:project).permit(:name, :description, :due_date, :email, :public_notice)
        end
end
