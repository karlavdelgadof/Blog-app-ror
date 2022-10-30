require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new }
  subject(:post) { Post.new }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title) }
    it { should validate_numericality_of(:comments_counter) }
    it { should validate_numericality_of(:likes_counter) }
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end
end
