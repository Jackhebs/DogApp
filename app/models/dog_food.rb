class DogFood < ApplicationRecord
  belongs_to :dog
  belongs_to :food
end
