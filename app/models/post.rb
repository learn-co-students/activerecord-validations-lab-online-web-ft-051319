class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-fiction)}
  validate :is_clickbait?

  VALID_CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if VALID_CLICKBAIT.none? { |bait| bait.match title }
      errors.add(:title, "Need more clickbait")
    end
  end
end
