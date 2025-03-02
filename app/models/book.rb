class Book < ApplicationRecord
    belongs_to :author
    has_many :reviews, dependent: :destroy  
  
    validates :title, presence: true
    validates :author_id, presence: true
    validates :description, presence: true, length: { maximum: 1000 }
    validates :isbn, uniqueness: true, numericality: { only_integer: true }, allow_nil: true
end
