class TodoSerializer < ActiveModel::Serializer
  attributes :id, :task, :description, :page, :status, :done_at, :user_id
end
