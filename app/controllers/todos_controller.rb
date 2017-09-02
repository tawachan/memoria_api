class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todos, only: [:index]
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    render json: json_with_serializer(@todos)
  end

  def show
    if !is_mine?
      raise StandardError, "only your own todos can be displayed"
    end
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: Project.find(@todo.project_id)
    else
      raise StandardError, "failed to create"
    end
  end

  def update
    if !is_mine?
      raise StandardError, "only your own todos can be updated"
    end
    original_project_id = @todo.project_id
    if @todo.update(todo_params)
      render json: Project.find(original_project_id)
    else
      raise StandardError, "failed to update"
    end
  end

  def destroy
    if !is_mine?
      raise StandardError, "only your own todos can be destroyed"
    end
    if @todo.destroy
      render json: Project.find(@todo.project_id)
    else
      raise StandardError, "failed to destroy"
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:task, :description, :page, :status, :done_at, :project_id).merge(user: current_user)
  end

  def set_todos
    @todos = current_user.todos
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
  def is_mine?
    current_user.id == @todo.user_id
  end

  def json_with_serializer(todos)
    return ActiveModel::Serializer::CollectionSerializer.new(
               todos,
               each_serializer: TodoSerializer
           ).to_json
  end
end
