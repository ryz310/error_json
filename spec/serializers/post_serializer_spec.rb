require 'rails_helper'

RSpec.describe PostSerializer, type: :serializer do
  subject(:serializer) { PostSerializer.new(post) }

  context 'when validated' do
    let(:post) { FactoryGirl.build(:post) }
    it do
      expect(serializer.to_json).to eq(
        {
          id: post.id,
          title: post.title,
          body: post.body
        }.to_json
      )
    end
  end

  context 'when invalidated' do
    let(:post) { FactoryGirl.build(:post, title: nil) }
    it do
      error = PostSerializer::ErrorSerializer.new(post)
      expect(error.to_json).to eq(
        {
          title: ['can\'t be blank'],
        }.to_json
      )
    end
  end
end
