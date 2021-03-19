class PitchingResult < ApplicationRecord
  belongs_to :game
  has_many :at_bats
  has_many :batting_results, through: :at_bats
end
