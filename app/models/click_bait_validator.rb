class ClickBaitValidator < ActiveModel::Validator

  # def validate_each(object, attribute, value)
  #   required = ["Won't Believe", "Secret", "Top", "Guess"]
  #   unless (value.split(" ") & required).any?
  #     object.errors[attribute] << "Not clickbaity enough"
  #   end
  # end

  CLICKBAIT = [/Won't Believe/i,/Secret/i,/Top [0-9]*/i,/Guess/i] #the i is to make it case insensitive (optional attribute)


  def validate(record)
    unless CLICKBAIT.any?{|word| word.match record.title} #returns true at the first instance record.title contains an element from the required list
      record.errors[:title] << "Not clickbaity enough"
    end
  end
end
