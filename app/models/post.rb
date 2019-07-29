class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    def clickbait
        if self.title =~ /(Won't Believe|Secret|Top \d|Guess)/
            true
        else 
            errors.add(:title, "not clickbait")
        end
    end

    # CLICKBAIT_PATTERNS = [
    # /Won't Believe/i,
    # /Secret/i,
    # /Top [0-9]*/i,
    # /Guess/i
    # ]

    # def is_clickbait?
    #     if CLICKBAIT_PATTERNS.none? { |pattern| pattern.match title }
    #         errors.add(:title, "must be clickbait")
    #     end
    # end
end
