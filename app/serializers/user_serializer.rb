class UserSerializer < ActiveModel::Serializer
  attributes :id, :projects
  has_many :todos
  has_many :projects
end
