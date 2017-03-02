class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait


  def clickbait
    click_array = ["Won't Believe", "Secret", "Top", "Guess"]
    click_array.each do |word|
      if title && !title.include?(word)
        errors.add(:title, "blahhhh")
        return false
      else
        return true
      end
    end
  end

end
