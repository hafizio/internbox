class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :admin_or_project_owner!, only: [:edit, :update, :destroy]

  def index
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
      @projects = Project.all
    end
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        Notifier.new_project(@project).deliver
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :github_url, :mentor_role, :user_id, :description, :project_level, :all_tags)
    end

    def admin_or_project_owner!
      if admin_signed_in?
      else
        @project.user_id != current_user.id
        redirect_to root_path
        flash[:notice] = 'You do not have enough permission to do this'
      end
    end
end
