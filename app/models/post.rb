class Post < ActiveRecord::Base

  MAX_NUMBER_OF_PICTURES = 3

  belongs_to :user
  has_many :post_pictures
  accepts_nested_attributes_for :post_pictures

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 160 }
  validates_length_of :post_pictures, maximum: self::MAX_NUMBER_OF_PICTURES, message: "Maximum #{Post::MAX_NUMBER_OF_PICTURES} pictures allowed per post."
end
