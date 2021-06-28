# frozen_string_literal: true

class Dog < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :name, uniqueness: { case_sensitive: false }
  validates :weight, presence: true,
            numericality: { greater_than: 0, less_than: 161 }

  def information; end

  def age
    months = ((Time.current - birthdate) / (60 * 60 * 24 * 30)).to_i

    {
      years: (months / 12).to_i,
      months: (months % 12)
    }
  end
end
