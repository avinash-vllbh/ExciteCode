class ProjectsController < ApplicationController
  # load_and_authorize_resource :find_by => :slug
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else 
      flash[:alert] = "Failed to save the project"
      redirect_to new_project_path
    end
  end
  
  def show
    @project = Project.find_by(slug: params[:slug])
    if @project.nil?
      flash[:alert] = "request project name is not valid"
      redirect_to projects_path
    end
  end
  
  # Don't want to destroy anything
  # def destroy

  # end
 
  private
    def project_params
      params.require(:project).permit(:title, :description, :language)
    end
end