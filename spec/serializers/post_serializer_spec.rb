require 'rails_helper'

RSpec.describe PostSerializer, type: :serializer do
  subject(:serializer) { PostSerializer.new(post) }
  let(:post) { FactoryGirl.build(:post) }

  it do
    expect(serializer.to_json).to eq(
      {
        id: post.id,
        title: post.title,
        body: post.body,
      }.to_json
    )
  end
end
