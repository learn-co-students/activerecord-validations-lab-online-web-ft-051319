class ClickBaitValidator < ActiveModel::Validator

  # def validate_each(object, attribute, value)
  #   required = ["Won't Believe", "Secret", "Top", "Guess"]
  #   unless (value.split(" ") & required).any?
  #     object.errors[attribute] << "Not clickbaity enough"
  #   end
  # end

  def validate(record)
    required=["Won't Believe", "Secret", "Top", "Guess"]
    if !record.title==""
      unless required.any?{|word| record.title.include?(word)} #returns true at the first instance record.title contains an element from the required list
        record.errors[:title] << "Not clickbaity enough"
      end
    end
  end
end
