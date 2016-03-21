module FeatureHelpers
  def create_logged_in_user(with_posts = false)
    user_type = with_posts ? :user_with_posts : :user
    user = FactoryGirl.create(user_type)
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
