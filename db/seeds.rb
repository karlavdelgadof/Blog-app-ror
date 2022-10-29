# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.find_by(name: 'Tom')
second_user = User.find_by(name: 'Lilly')

4.times do
    Post.create do |post|
        post.author = first_user
        post.title = 'Title'
        post.text = 'Text'
        post.likes_counter = 0
        post.comments_counter = 0
    end
end

50.times do
    Comment.create do |comment|
        comment.post = Post.all.sample
        comment.author = second_user
        comment.text = 'comment'
    end
end