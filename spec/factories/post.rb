FactoryGirl.define do
  factroy :post do
    title "Post Title"
    body "Post bodies must be pretty long."
    user
    topic { Topic.create(name: 'Topic name') }
  end
end