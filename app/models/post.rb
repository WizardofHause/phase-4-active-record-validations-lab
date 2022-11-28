class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :make_clickbaity

    CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

    def make_clickbaity
        if CLICKBAIT.none? { |bait| bait.match title}
            errors.add(:title, "Not clickbait-y enough!")
        end
    end

end
