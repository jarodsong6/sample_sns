require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'as a user' do
    let(:authed_user) { create_logged_in_user true }
    scenario 'visits profile page' do
        visit user_path(authed_user)
        expect(page).to have_content(authed_user.name)
        expect(current_path).to eq(user_path(authed_user))

        authed_user.posts.order(created_at: :desc).paginate(page: 1).each do |post|
          expect(page).to have_content(post.content)
        end
    end
  end

  context 'as a guest' do
    user = FactoryGirl.create(:user)
    scenario 'visits profile page' do
        visit user_path(user)
        expect(current_path).to eq(new_user_session_path)
    end
  end
end
