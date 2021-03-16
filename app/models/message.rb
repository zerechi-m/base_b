class Message < ApplicationRecord
  belongs_to :room
  belongs_to :team

  validates :content, presence: true, unless: :format?

  private

  def format?
    self.game_day?
    self.stadium?
    self.address?
  end
end
