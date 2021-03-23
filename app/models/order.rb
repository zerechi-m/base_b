class Order < ApplicationRecord
  belongs_to :game
  belongs_to :team
  has_many :members
  has_many :batting_results
  
  with_options presence: true do 
    validates :position_id
    validates :batting_order, numericality: {in: 1..9}
  end
end