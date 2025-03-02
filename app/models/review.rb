class Review < ApplicationRecord
  belongs_to :book  # Remove 'belongs_to :user' if it exists

  validates :rating, presence: true
  validates :comment, presence: true
end
