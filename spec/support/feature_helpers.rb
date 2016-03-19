module FeatureHelpers
  def create_logged_in_user
    user = FactoryGirl.create(:user)
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
