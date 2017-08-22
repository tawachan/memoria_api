class ProjectsController < ApplicationController

  def index
    projects = Project.all
    render json: json_with_serializer(projects)
  end

  def show
    project = Project.find(params[:id])
    render json: project
  end

  def create
    project = Project.new(project_params)
    if project.save
      render json: project
    else
      raise StandardError, "failed to create"
    end
  end

  def update
    project = Project.find(params[:id])
    if project.update(project_params)
      render json: project
    else
      raise StandardError, "failed to update"
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project.destroy
      render json: project
    else
      raise StandardError, "failed to destroy"
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :status, :project_id, :user_id)
  end

  private
  def json_with_serializer(projects)
    return ActiveModel::Serializer::CollectionSerializer.new(
               projects,
               each_serializer: ProjectSerializer
           ).to_json
  end
end
