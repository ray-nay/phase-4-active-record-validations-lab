class Post < ApplicationRecord
#title can not be empty
    validates :title, presence: true
  # Post content is at least 250 characters long
  validates :content, length: { minimum: 250 }

  # Post summary is a maximum of 250 characters
  validates :summary, length: { maximum: 250 }

  # Post category is either Fiction or Non-Fiction
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

  validate :clickbait_title

  private

  def clickbait_title
    unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess"))
      errors.add(:title, 'must be clickbait-y')
    end
  end

end
