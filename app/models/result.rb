class Result < ApplicationRecord
  belongs_to :game
  belongs_to :at_bat

  with_options presence: true do
    validates :batting_first
    validates :fielding_first
  end
end
