module TestFactories

  def associated_post(options={})
    post_options = {
    title: 'Post title',
    body: 'Post bodies must be pretty long.',
    topic: Topic.create(name: 'Topic name'),
    user: authenticated_user
      }.merge(options)
    Post.create(post_options)
  end

  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password'}
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

  FactoryGirl.define do
    factory :user do
      email 'test@example.com'
      password 'F4K3P455W0RD'
    end
    # if needed
    # is_active true
  end
end