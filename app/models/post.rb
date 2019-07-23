class Post < ActiveRecord::Base
    validate :title_clickbait
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    def title_clickbait
        key_words = ["Secret", "Guess", "Won't Believe", "Top [number]"]
        unless title.present? && key_words.find{|word| title.include?(word)}
            self.errors.add(:title, false)
        end
    end
end