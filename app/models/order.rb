class Order < ApplicationRecord
  belongs_to :game
  belongs_to :team
  has_many :members
  has_many :batting_results
  
  with_options presence: true do 
    validates :position_id, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
    validates :batting_order, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 9}
  end



end