1.times do 
  Post.create!(
    title: "A Test Post",
    body: "Let's see if this works!"
    )
  end

post = Post.all

1.times do
  Comment.create!(
    post: post,
    body: "The post worked, how 'bout the comment?"
   )
end

comment = Comment.all 
