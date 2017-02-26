module Errors
  class CommentSerializer < ActiveModel::Serializer
    attributes :name, :body

    def initialize(*args)
      super
      object.valid?
    end

    def name
      object.errors[:name].presence
    end

    def body
      object.errors[:body].presence
    end
  end
end
