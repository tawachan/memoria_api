class UserSerializer < ActiveModel::Serializer
  include TimeFormatJson
  attributes :id, :projects
  has_many :todos
  has_many :projects
end
