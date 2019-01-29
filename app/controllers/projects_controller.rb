class ProjectsController < ApplicationController
    layout "projects"
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :authenticate, only: [:index]


    def index
        @projects = Project.all
        respond_to do |f|
            f.html
            f.json {render json: @projects}
        end
         
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
        params[:tasks].to_i.times do
            @project.tasks.build
        end
    end

    def create
        @project = Project.new(project_params)

        # @project.tasks.build
        # binding.pry

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
            params.require(:project).permit(:name, :description, :due_date, :email, :public_notice, :tasks_attributes => [
                :title,
                :description
            ])
        end
end
