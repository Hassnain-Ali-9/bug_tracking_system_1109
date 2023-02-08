class BugsController < ApplicationController

  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  def index
    @bugs = @project.bugs
  end

  def show
  end

  def new
    @bug = @project.bugs.new
  end

  def edit
  end

  def create
    @bug = @project.bugs.new(bug_params)
    @bug.creator = current_user

    if @bug.save
      redirect_to [@project, @bug], notice: 'Bug was successfully created.'
    else
      render :new
    end
  end

  def update
    if @bug.update(bug_params)
      redirect_to [@project, @bug], notice: 'Bug was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bug.destroy
    redirect_to project_bugs_url, notice: 'Bug was successfully destroyed.'
  end

  private

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :screenshot, :type, :status)
  end
end
