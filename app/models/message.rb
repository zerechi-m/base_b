class Message < ApplicationRecord
  belongs_to :room
  belongs_to :team

  validates :content, presence: true
end
