# frozen_string_literal: true

class Dog < ApplicationRecord
  validates :name,
            presence: true,
            format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' },
            length: { minimum: 3 },
            uniqueness: { case_sensitive: false }
            # inclusion: { in: [''], message:'must be a dog name' }
  validates :weight,
            presence: true,
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
