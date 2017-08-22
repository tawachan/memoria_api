class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id, :status, :created_at, :updated_at, :todos
  has_many :todos
end
