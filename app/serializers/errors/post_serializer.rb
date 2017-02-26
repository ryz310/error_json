module Errors
  class PostSerializer < ActiveModel::Serializer
    attributes :title

    def initialize(*args)
      super
      object.valid?
    end

    def title
      object.errors[:title].presence
    end
  end
end
