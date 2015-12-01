require 'rails_helper'

RSpec.describe Post, type: :model do
  describe ".validates" do
    it "must have a body" do
      post = Post.new(body: nil)
      expect(post).to_not be_valid
      expect(post.errors.keys).to include :body
    end

    it "can't have 141 characters" do
      expect(Post.new(body: "a" * 141)).to be_invalid
    end

    it "can have 140 characters" do
      expect(Post.new(body: "a" * 140)).to be_valid
    end
  end

  it "counts it's characters" do
    expect(Post.new(body: "b" * 122).character_count).to eq 122
  end
end
