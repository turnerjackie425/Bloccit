 require 'faker'

 #Create Users
 5.times do 
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
end
users = User.all
 
 # Create Posts
 50.times do
   Post.create!(
     user:   users.sample, 
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
    #user: users.sample, 
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
user = User.first
user.skip_confirmation!
user.update_attributes!(
  email: 'turnerjackie425@gmail.com',
  password: 'helloworld'
)

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

10.times do 
  Advertisement.create!(
    title: Faker::Internet.domain_name,
    copy: Faker::Company.catch_phrase,
    price: 0
  )
end



