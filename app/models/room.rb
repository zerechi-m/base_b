class Room < ApplicationRecord
  has_many :room_teams
  has_many :teams, through: :room_teams
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
