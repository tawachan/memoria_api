class TodoSerializer < ActiveModel::Serializer
  include TimeFormatJson
  attributes :id, :task, :description, :page, :status, :done_at, :user_id, :project_id
end
