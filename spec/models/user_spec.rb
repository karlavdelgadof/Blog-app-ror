require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Taylor', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Pennsylvania.') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_counter) }
  end

  describe 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end
  
end
