class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :release_year, presence: true, if: :released,
    numericality: { less_than_or_equal_to: Time.now.year }
  validates :released, presence: true, if: :release_year
end
