require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it 'is invalid without a user id' do
    expect(FactoryGirl.build(:post, user_id: nil)).to be_invalid
  end

  it 'is invalid without content' do
    expect(FactoryGirl.build(:post, content: nil)).to be_invalid
  end

  it 'is invalid with content more than 160 characters' do
    expect(FactoryGirl.build(:post, content: 'j' * 161)).to be_invalid
  end
end
