class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait_title

  private

  def clickbait_title
    clickbait_phrases = [
      "Won't Believe",
      "Secret",
      "Top",
      "Guess"
    ]

    unless clickbait_phrases.any? { |phrase| title&.include?(phrase) }
      errors.add(:title, "must be clickbait-y")
    end
  end

end
