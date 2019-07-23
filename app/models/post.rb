class Post < ActiveRecord::Base

  include ActiveModel::Validations #necessary for custom validators

  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates_with ClickBaitValidator
  validates :title, presence: true

end
