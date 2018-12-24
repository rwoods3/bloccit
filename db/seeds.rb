 require 'random_data'

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
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     topic:  topics.sample
   )
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 p = Post.find_or_create_by!(body: "Ray Test Body", title: "Ray Test Title", topic: topics.sample)
 Comment.find_or_create_by!(body: "Ray Test Comment Body", post: p)
 
# Create Advertisements
50.times do
	Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_price)
end

50.times do
	Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_resolve)
end

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"