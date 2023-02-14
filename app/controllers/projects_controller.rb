class ProjectsController < ApplicationController
  load_and_authorize_resource

  before_action :find_project, except: [:index, :new, :create]

  def index
    if current_user.user_type == 'manager'
      @projects = Project.where(user_id: current_user.id)
    else
      @projects = current_user.projects    
    end
  end

  def new
    @project=Project.new
  end

  def show
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id   
    if @project.save
      redirect_to @project
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit', status: :unprocessable_entity
    end
  end
     
  def destroy
    @project.destroy
    redirect_to projects_path, status: :see_other
  end
  

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def find_project
    @project = Project.find params[:id]
  end
end