 require 'random_data'

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
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

 p = Post.find_or_create_by!(body: "Ray Test Body", title: "Ray Test Title")
 Comment.find_or_create_by!(body: "Ray Test Comment Body", post: p)
 
# Create Advertisements
50.times do
	Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_price)
end

50.times do
	Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_resolve)
end

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"