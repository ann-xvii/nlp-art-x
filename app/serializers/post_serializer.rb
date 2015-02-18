class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :keywords
end
