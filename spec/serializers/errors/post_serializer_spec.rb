require 'rails_helper'

RSpec.describe Errors::PostSerializer, type: :serializer do
  subject(:serializer) { Errors::PostSerializer.new(post) }

  describe 'only post' do
    context 'when validated' do
      let(:post) { FactoryGirl.build(:post) }
      it do
        expect(serializer.to_json).to eq(
          {
            title: nil,
            comments: []
          }.to_json
        )
      end
    end

    context 'when invalidated' do
      let(:post) { FactoryGirl.build(:post, title: nil) }
      it do
        expect(serializer.to_json).to eq(
          {
            title: ['can\'t be blank'],
            comments: []
          }.to_json
        )
      end
    end
  end

  describe 'has comments' do
    context 'when validated' do
      let(:post) do
        FactoryGirl.build(:post).tap do |p|
          p.comments.build FactoryGirl.attributes_for(:comment)
        end
      end

      it do
        expect(serializer.to_json).to eq(
          {
            title: nil,
            comments: [
              {
                name: nil,
                body: nil
              }
            ]
          }.to_json
        )
      end
    end

    context 'when invalidated' do
      let(:post) do
        FactoryGirl.build(:post, title: nil).tap do |p|
          p.comments.build FactoryGirl.attributes_for(:comment, name: nil)
        end
      end

      it do
        expect(serializer.to_json).to eq(
          {
            title: ['can\'t be blank'],
            comments: [
              {
                name: ['can\'t be blank'],
                body: nil
              }
            ]
          }.to_json
        )
      end
    end
  end
end
