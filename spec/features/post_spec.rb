require 'rails_helper'
RSpec.feature "Posts", type: :feature do
  before :each do
    @user_one = User.create(name: 'Ofelia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Amsterdam.')
    @user_two = User.create(name: 'Ofelia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Amsterdam.')
      3.times do
        Post.create(author: @user_one, title: 'Title', text: 'This is my post')
      end
      6.times do
        Comment.create(author: @user_two, post: @user_one.posts[0], text: 'This is a comment')
      end
  end
    describe "User post index page" do
      it "Show user's: profile pic, name, number of posts"do
        visit user_posts_path(@user_one.id)
        expect(page).to have_tag('section', :with => { :class => 'user-details'}) do
          with_tag "img", :src => @user_one.photo
          with_tag "a", :text => @user_one.name
          with_tag "span", :text => "Posts: #{@user_one.posts_counter}"
        end
      end
      it "Show post's first comments"do
        visit user_posts_path(@user_one.id)
        expect(page).to have_tag("li", :with => { :class => ['post', 'post-index']}) do
          with_tag "h3", :text => "Post #{'#'}#{@user_one.posts[0].id}"
          with_tag "ul", :with => { :class => 'comments'}
          with_tag "li", :with => { :class => 'comment'}, :count => 5
        end
      end
      it "Show post's: title, body, number of comments and likes"do
        visit user_posts_path(@user_one.id)
        expect(page).to have_tag('ul') do
          with_tag "li", :with => { :class => ['post', 'post-index']}, :count => @user_one.posts.count
          with_tag "h3", :text => "Post #{'#'}#{@user_one.posts[0].id}"
          with_tag "p", :text => @user_one.posts[0].text
          with_tag "span", :text => "Comments: #{@user_one.posts[0].comments_counter}"
          with_tag "span", :text => "Likes: #{@user_one.posts[0].likes_counter}"
        end
      end
      it "Should redirect to the post's show page." do
        visit user_posts_path(@user_one.id)
        click_on("Post #{'#'}#{@user_one.posts[0].id}")
        expect(page).to have_current_path(user_post_path(@user_one.id, @user_one.posts[0].id))
      end
      it "Should see a section for pagination if there are more posts than fit on the view." do
        visit user_posts_path(@user_one.id)
        expect(page).to have_tag('a', :with => { :class => 'see-more'})
      end
    end
    describe "Post show page" do
      it "Show post's: body, title, author, comments and likes"do
        visit user_post_path(@user_one.id, @user_one.posts[0].id)
        expect(page).to have_tag('section', :with => { :class => 'post'}) do
          with_tag "h1", :text => "Post: #{@user_one.posts[0].title} by #{@user_one.name}"
          with_tag "p", :text => @user_one.posts[0].text
          with_tag "span", :text => "Comments: #{@user_one.posts[0].comments_counter}"
          with_tag "span", :text => "Likes: #{@user_one.posts[0].likes_counter}"
        end
      end
      it "Show commentor's username and comment" do
        visit user_post_path(@user_one.id, @user_one.posts[0].id)
        expect(page).to have_tag('section', :with => { :class => 'comment-section'}) do
          with_tag "li", :with => { :class => 'comment'}, :count => 6
          with_tag "span", :text => "#{@user_one.posts[0].comments[0].author.name}: #{@user_one.posts[0].comments[0].text}"
        end
      end
    end
end
