require 'rails_helper'
RSpec.feature 'Users', type: :feature do
  before :each do
    @user_one = User.create(name: 'Taylor', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from New York.')
    @user_two = User.create(name: 'Ofelia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Amsterdam.')
    3.times do
      Post.create(author: @user_one, title: 'Title', text: 'This is my post')
    end
    3.times do
      Post.create(author: @user_two, title: 'Title', text: 'This is my post')
    end
  end
  describe 'User index page' do
    it 'Show list of users, photos and number of posts' do
      visit users_path
      expect(page).to have_tag('ul', with: { id: 'list-users' }) do
        with_tag 'li', with: { class: 'user-card' }, count: 2
        with_tag 'div.card-text', text: @user_one.name
        with_tag 'img', src: @user_one.photo
        with_tag 'span', text: "Number of posts: #{@user_one.posts_counter}"
      end
    end
    it "Should redirect to user's show page" do
      visit users_path
      click_on(@user_two.name)
      expect(page).to have_current_path(user_path(@user_two.id))
    end
  end
  describe 'User show page' do
    it "Show user's: profile pic, name, number of posts" do
      visit user_path(@user_one.id)
      expect(page).to have_tag('section', with: { class: 'user-details' }) do
        with_tag 'img', src: @user_one.photo
        with_tag 'a', text: @user_one.name
        with_tag 'span', text: "Posts: #{@user_one.posts_counter}"
      end
    end
    it "Show user's bio" do
      visit user_path(@user_one.id)
      expect(page).to have_tag('section', with: { class: 'user-bio' }) do
        with_tag 'p', text: @user_one.bio
      end
    end
    it "List user's recent posts" do
      visit user_path(@user_one.id)
      expect(page).to have_tag('ul') do
        with_tag 'li', with: { class: 'post' }, count: 3
      end
    end
    it "Should redirect user to post's show page." do
      visit user_path(@user_one.id)
      click_link("Post ##{@user_one.three_most_recent_posts[0].id}")
      expect(page).to have_current_path(user_post_path(@user_one.id, @user_one.three_most_recent_posts[0].id))
    end
    it "Should show link/button see all posts which should redirect to user's post's index page." do
      visit user_path(@user_two.id)
      expect(page).to have_tag('a', text: 'See all posts')
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user_two.id))
    end
  end
end
