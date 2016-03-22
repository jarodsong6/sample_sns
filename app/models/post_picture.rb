class PostPicture < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :post

  validates :picture, presence: true
  validate  :picture_size
  validates_associated :post

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
