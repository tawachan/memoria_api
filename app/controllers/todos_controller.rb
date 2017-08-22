class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    todos = Todo.all
    render json: json_with_serializer(todos)
  end

  def show
    todo = Todo.find(params[:id])
    render json: todo
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      raise StandardError, "failed to create"
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo
    else
      raise StandardError, "failed to update"
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      render json: todo
    else
      raise StandardError, "failed to destroy"
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:task, :description, :page, :status, :done_at, :project_id, :user_id)
  end

  def json_with_serializer(todos)
    return ActiveModel::Serializer::CollectionSerializer.new(
               todos,
               each_serializer: TodoSerializer
           ).to_json
  end
end
