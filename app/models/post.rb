class Post < ActiveRecord::Base
    validate :title_is_click_baity, on: :create

    validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    def title_is_click_baity
        # binding.pry
        if self.title 
            if self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Guess") || self.title.include?("Top[number]") 
                true  
            else 
                errors.add(:title, "Not Clickbait")
            end  
        end 
    end 
end
