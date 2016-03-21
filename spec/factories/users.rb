FactoryGirl.define do
  factory :user do
    name                   'Test User'
    email                  'user@example.com'
    password               'password'
    password_confirmation  'password'

    factory :user_with_posts do
      transient do
        posts_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
      end
    end
  end
end
