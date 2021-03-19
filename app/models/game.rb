class Game < ApplicationRecord
  has_many :team_games, dependent: :destroy
  has_many :teams, through: :team_games
  has_one :result, dependent: :destroy

  with_options presence: true do
    validates :game_day
    validates :game_time
    validates :stadium
    validates :address
  end
end