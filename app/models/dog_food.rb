class DogFood < ApplicationRecord
  belongs_to :dog
  belongs_to :food
  scope :dog_food_name, -> { order('LOWER(dog_id) ASC') }
  scope :food_by_dog, -> { order('LOWER(food_id) ASC') }


  validates_uniqueness_of :dog_id, scope: [:food_id]
end
