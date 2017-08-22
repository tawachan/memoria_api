class ProjectSerializer < ActiveModel::Serializer
  include TimeFormatJson
  attributes :id, :name, :description, :user_id, :created_at, :updated_at, :todos
  has_many :todos
end

