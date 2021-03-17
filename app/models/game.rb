class Game < ApplicationRecord
  has_many :teams, through: :team_games
  has_many :team_games, dependent: :destroy
end
