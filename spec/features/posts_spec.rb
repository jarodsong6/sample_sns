require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  context 'a user' do
    let(:authed_user) { create_logged_in_user }
    scenario 'composes a post' do
        visit user_path(authed_user)
        visit root_path

        content_text = 'Saw a UFO this morning'
        fill_in 'post_content', with: content_text
        click_button 'Post'
        expect(page).to have_content(authed_user.name)
        expect(page).to have_content('Post created!')
        expect(current_path).to eq(root_path)

        click_link 'view my profile'
        expect(page).to have_content(authed_user.name)
        expect(page).to have_content(content_text)
    end
  end

  # context 'a guest' do
  #   user = FactoryGirl.create(:user)
  #   scenario 'composes a post' do
  #       visit user_path(user)
  #       expect(current_path).to eq(new_user_session_path)
  #   end
  # end
end
