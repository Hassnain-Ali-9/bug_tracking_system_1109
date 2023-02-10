class BugsController < ApplicationController
  before_action :find_bug, only: [:show, :destroy, :update, :edit, :assign]
  before_action :get_project

  def index
    if current_user.user_type =='developer'
     @bugs = current_user.projects.flat_map(&:bugs)
     else 
      @bugs = @project.bugs.all
    end

  end

  def new
    @bug = @project.bugs.new
  end

  def show
  end

  def edit
  end

  def update
    if @project.bugs.update(bug_params)
      redirect_to project_bugs_path
    else
      render 'edit', status: :unprocessable_entity
    end

  end

  def create
    @bug = @project.bugs.new(bug_params)
    @bug.creator_id = current_user.id

    if @bug.save 
      redirect_to project_bugs_path
    else
      render 'new' , status: :unprocessable_entity
    end
  end

  #def assigned
   # @bugs = @project.bugs.where(:solver_id => current_user.id)
    #authorize @bugs
  #end


  def destroy
    @bug.destroy
    redirect_to project_bugs_path, status: :see_other
  end

  # def assign
  #   if @bug.update_attribute(:developer_id,current_user.id)
  #     redirect_to project_bugs_path
  #   else
  #     redirect_to  project_bugs_path, status: :unprocessable_entity
  #   end
  #   authorize @bug
  # end

  private

  def bug_params
    params.require(:bug).permit(:title,:description,:deadline, :screenshot,:status,:type)
  end

  def find_bug
    @bug = Bug.find params[:id]
  end

  def get_project
    @project = Project.find(params[:project_id])
  end
end
