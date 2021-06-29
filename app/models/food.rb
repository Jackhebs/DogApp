class Food < ApplicationRecord

  enum type: {granule: 0, can: 1, barf: 2}

  validates :type, presence: true,
            length: { minimum: 3 }
  validates :weight, presence: true,
            numericality: { greater_than: 0}
end