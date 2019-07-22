class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validates :title, presence: true, if: :clickbait_title?


  @@clickbait = [/Top [0-9]/i, /Guess/i, /Won't Believe/i, /Secret/i]

    def clickbait_title?
        if @@clickbait.none? { |clickbait| clickbait.match(title) }
            errors.add(:title, "not clickbait")
        end
    end

end
