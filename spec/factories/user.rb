FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
  
  factory :user_with_post_and_comment do
    user
    comment
    post 
  after(:build) do  #|comment|
      #comment.class.skip_callback(:create, :after, :send_favorite_emails)
  end
end

