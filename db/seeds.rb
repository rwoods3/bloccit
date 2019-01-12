 require 'random_data'

 # Create Users
 5.times do
   User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all

 # Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 # Create Posts
 50.times do
 # #1
   Post.create!(
     user:   users.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     topic:  topics.sample
   )
 end
 posts = Post.all

  # Create Sponsored Posts
 50.times do
 # #1
   SponsoredPost.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price:  RandomData.random_price,
     topic:  topics.sample
   )
 end
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 p = Post.find_or_create_by!(body: "Ray Test Body\nThis is a test with 20+ characters to pass validation", title: "Ray Test Title", topic: topics.sample, user: users.sample)
 Comment.find_or_create_by!(body: "Ray Test Comment Body", post: p)
 
# Create Advertisements
50.times do
	Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_price)
end

50.times do
	Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_resolve)
end

 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} sponsored posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"