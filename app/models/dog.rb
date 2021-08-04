# frozen_string_literal: true

class Dog < ApplicationRecord
  has_many :dog_foods, dependent: :destroy
  scope :dog_by_name, -> { order('LOWER(name) ASC') }
  #scope :dog_by_name33, -> {all.to_a.sort_by(&:name )}
  #scope :name_starts_with, ->(prefix) { where("name LIKE '#{prefix}%'") }
  accepts_nested_attributes_for :dog_foods, allow_destroy: true

  validates :name,
            presence: true,
            format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' },
            length: { minimum: 3, message:'must be greater than two letters' },
            uniqueness: { case_sensitive: false }
  validates :weight,
            presence: true,
            numericality: { greater_than: 0, less_than: 161 }
  validates :birthdate,
            presence: true,
            numericality: {greater_than: 0 }

  def information; end

  def age
    months = ((Time.current - birthdate) / (60 * 60 * 24 * 30)).to_i

    {
      years: (months / 12).to_i,
      months: (months % 12)
    }
  end

  def all_dog_foods
    res = []
    Food.find_each do |food|
      res << DogFood.find_or_initialize_by(food: food, dog: self)
    end
    res
  end
  end

