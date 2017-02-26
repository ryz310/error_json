require 'rails_helper'

RSpec.describe Errors::PostSerializer, type: :serializer do
  subject(:serializer) { Errors::PostSerializer.new(post) }

  context 'when validated' do
    let(:post) { FactoryGirl.build(:post) }
    it do
      expect(serializer.to_json).to eq(
        { title: nil }.to_json
      )
    end
  end

  context 'when invalidated' do
    let(:post) { FactoryGirl.build(:post, title: nil) }
    it do
      expect(serializer.to_json).to eq(
        { title: ['can\'t be blank'] }.to_json
      )
    end
  end
end
