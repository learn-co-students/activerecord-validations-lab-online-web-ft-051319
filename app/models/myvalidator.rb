class MyValidator < ActiveModel::Validator 
    
    def validate(post)
        unless post.title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess") || title.include?("Top[number]")
            return false 
        end 
    end 

end 