# frozen_string_literal: true

class Dog < ApplicationRecord
  has_many :dog_foods

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
end
