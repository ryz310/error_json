module Errors
  class PostSerializer < ActiveModel::Serializer
    attributes :title
    has_many :comments, serializer: Errors::CommentSerializer

    def initialize(*args)
      super
      object.valid?
    end

    def title
      object.errors[:title].presence
    end
  end
end
