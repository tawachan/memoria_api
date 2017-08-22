class UserSerializer < ActiveModel::Serializer
  attributes :id, :projects
  has_many :todos, :projects
end
