class TodoSerializer < ActiveModel::Serializer
  attributes :id, :is_completed, :title, :created_at, :updated_at
end
