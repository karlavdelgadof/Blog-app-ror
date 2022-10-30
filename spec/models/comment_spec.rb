require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:post) }
    it { should belong_to(:author) }
  end
end
