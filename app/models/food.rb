class Food < ApplicationRecord
  belongs_to :dog

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
end