class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_projects, only: [:index]
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    render json: json_with_serializer(@projects)
  end

  def show
    render json: @project
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project
    else
      raise StandardError, "failed to create"
    end
  end

  def update
    if !is_mine?
      raise StandardError, "only your own projects can be updated"
    end
    if @project.update(project_params)
      render json: @project
    else
      raise StandardError, "failed to update"
    end
  end

  def destroy
    if !is_mine?
      raise StandardError, "only your own projects can be destroyed"
    end
    if @project.destroy
      render json: @project
    else
      raise StandardError, "failed to destroy"
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :status, :project_id).merge(user: current_user)
  end

  def set_projects
    @projects = current_user.projects
  end

  def set_project
    @project = Project.find(params[:id])
  end
  def is_mine?
    current_user.id == @project.user_id
  end

  def json_with_serializer(projects)
    return ActiveModel::Serializer::CollectionSerializer.new(
               projects,
               each_serializer: ProjectSerializer
           ).to_json
  end
end
