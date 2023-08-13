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

  def self.available_keywords
    ['Anxiety', 'Addiction', 'ADHD', 'Bipolar Disorder', 'Breathing Techniques',
     'Cognitive Behavioral Therapy', 'Counselling', 'Depression', 'Eating Disorders',
     'Emotional Intelligence', 'Empathy', 'Food Guilt', 'Grief', 'Happiness', 'Loneliness',
     'Meditation', 'Mental Health', 'Mindfulness', 'Obsessive Compulsive Disorder', 'Online Bullying',
     'Personal Growth', 'PTSD', 'Self Love', 'Social Anxiety', 'Stress', 'Techniques To Use', 'Therapy']
  end
  def self.selfgrowth
    ['Counselling', 'Emotional Intelligence', 'Empathy', 'Happiness',
     'Meditation', 'Mindfulness', 'Personal Growth', 'Self Love']
  end
  def self.mentalhealth
    ['Anxiety', 'Addiction', 'ADHD', 'Bipolar Disorder', 'Breathing Techniques',
     'Cognitive Behavioral Therapy', 'Depression', 'Eating Disorders',
     'Food Guilt', 'Grief', 'Loneliness', 'Mental Health', 'Obsessive Compulsive Disorder',
     'Online Bullying', 'PTSD', 'Social Anxiety', 'Stress', 'Therapy']
  end

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
