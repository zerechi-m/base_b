class Room < ApplicationRecord
  has_many :room_teams
  has_many :teams, through: :room_teams

  validates :name, presence: true
end
