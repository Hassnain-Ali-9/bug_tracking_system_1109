class UserProjectsController < ApplicationController
  load_and_authorize_resource
 before_action :find_user_project, only: [:show, :destroy]
 before_action :get_project

  def index
	 @user_projects = @project.user_projects
  end

  def new
	 @user_project = @project.user_projects.new
  end

  def show
  end

 # def create
  #  @user_project = @project.user_projects.build(user_project_params) 
   # if @user_project.save
    #  redirect_to project_user_projects_path(@project)
     #else
      #render 'new'
    #end
  #end

  

 def create
   user_ids = user_project_params[:user_id]
   if user_ids.present?
     user_ids.each do |user_id|
      @user_project = @project.user_projects.find_or_create_by(user_id: user_id)
      @user_project.save
      end
    end
     redirect_to project_user_projects_path(@project)
 end



  def destroy
	  @user_project.destroy
    redirect_to project_user_projects_path(@project), status: :see_other
  end

  private

  def user_project_params
	  params.require(:user_project).permit(user_id: [])
  end

  def find_user_project
    @user_project = UserProject.find params[:id]
  end

  def get_project
    @project = Project.find(params[:project_id])
  end
end