class UserSerializer < ActiveModel::Serializer
  include TimeFormatJson
  attributes :id, :name, :email
  # has_many :todos
  # has_many :projects
end
