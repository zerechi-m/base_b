class Result < ApplicationRecord
  belongs_to :game

  with_options presence: true do
    validates :batting_first
    validates :fielding_first
  end
end
