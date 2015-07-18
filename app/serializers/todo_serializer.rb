class TodoSerializer < ActiveModel::Serializer
  attributes :id, :is_completed, :title
end
