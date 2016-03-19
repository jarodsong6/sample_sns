require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'as a user' do
    let(:authed_user) { create_logged_in_user }
    scenario 'visits profile page' do
        visit user_path(authed_user)
        expect(page).to have_content(authed_user.name)
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
