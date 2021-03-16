class Message < ApplicationRecord
  belongs_to :room
  belongs_to :team

  validates :content, presence: true, unless: :format?
  
  with_options presence: true, unless: :message? do
    validates :game_day
    validates :game_time
    validates :stadium
    validates :address
  end

  private

  def format?
    self.game_day?
    self.game_time?
    self.stadium?
    self.address?
  end

  def message?
    self.content?
  end
end
