require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Mumenya', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.')
    3.times do
      Post.create(author: @user, title: 'Title', text: 'This is my post')
    end
  end

  describe 'GET #index' do
    before(:example) { get user_posts_path(@user.id) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes placeholder text' do
      expect(response.body).to include(@user.name)
    end
  end

  describe 'GET #show' do
    before(:example) do
      @post = @user.posts[0]
      get user_post_path(@user.id, @post.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes placeholder text' do
      expect(response.body).to include(@post.title)
    end
  end
end
