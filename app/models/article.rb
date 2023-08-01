class Article < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :readtime, presence: true
  validates :keywords, presence: true
  has_one_attached :cover_image
  validate :validate_cover_image

  ###################
  private
  def validate_cover_image
    if cover_image.attached?
      unless cover_image.content_type.in?(%w[image/jpeg image/gif image/png])
        errors.add(:cover_image, "must be a valid image format")
      end

      if cover_image.byte_size > 10.megabytes
        errors.add(:cover_image, "should be less than 10MB")
      end
    end
  end

end
