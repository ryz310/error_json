class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body

  class ErrorSerializer < ActiveModel::Serializer
    attributes :title

    def title
      object.valid?
      object.errors[:title]
    end
  end
end
