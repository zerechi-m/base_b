class BattingResult < ApplicationRecord
  belongs_to :game
  has_many :at_bats
  has_many :pitching_results, through: :at_bats
end
