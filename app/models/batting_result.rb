class BattingResult < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :hit
  belongs_to :out
  belongs_to :field_error
  belongs_to :four_deadball

  belongs_to :game
  belongs_to :member
  belongs_to :order
  
  has_many :at_bats
  has_many :pitching_results, through: :at_bats
end
