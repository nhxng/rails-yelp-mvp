class Restaurant < ApplicationRecord
  CATEGORIES = %w(chinese italian japanese french belgian)
  has_many :reviews, dependent: :destroy
  validates :name, :address, presence: true
  validates :category, inclusion: { in: CATEGORIES,
    message: "%{value} is not a valid category" }
  validates_associated :reviews

  def average_rating(reviews)
    ratings = []
    reviews.each do |review|
      ratings << review.rating
    end
    if ratings.empty?
      "no ratings yet"
    else
      average = (ratings.reduce(:+) / ratings.length)
    end
  end
end

