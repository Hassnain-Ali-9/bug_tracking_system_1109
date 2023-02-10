class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.user_type == 'manager'
      @projects = Project.where(user_id: current_user.id)
    elsif current_user.user_type == 'developer'
      @projects = current_user.projects
    elsif current_user.user_type == 'QA'
      @projects = current_user.projects
    else
      
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
      render 'new'
    end
  end

  def edit
    authorize @project
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
    authorize @project
  end
  

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def find_project
    @project = Project.find params[:id]
  end
end