require 'pry'

class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbaity


  def clickbaity
    clickbaits=["Won\'t Believe", "Secret", "Top [number]", "Guess"]
  #  binding.pry
    # if title == nil
    #   return false
    # end
    clickbait=clickbaits.find do |cb|
      if title != nil
        title.include?(cb)
      end
    end

    unless clickbait
      self.errors.add(:title, "must be clickbait-y")
    end
  end
end
