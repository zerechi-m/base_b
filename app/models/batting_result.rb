class BattingResult < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :hit
  belongs_to :out
  belongs_to :field_error
  belongs_to :four_deadball
  belongs_to :point

  belongs_to :game
  belongs_to :member
  belongs_to :order
  
  has_many :at_bats
  has_many :pitching_results, through: :at_bats


  validates :hit_id, presence: true, unless: :hit?
  validates :out_id, presence: true, unless: :out?
  validates :time_base_id, presence: true, unless: :time_base?
  validates :four_deadball_id, presence: true, unless: :four_deadball?

  
  private 
  
  def hit?
    self.out_id? || self.time_base_id? || self.four_deadball_id?
  end
  def out? 
    self.hit_id? || self.time_base_id? || self.four_deadball_id?
  end
  def time_base?
    self.hit_id? || self.out_id? || self.four_deadball_id?
  end
  def four_deadball? 
    self.hit_id? || self.out_id? || self.time_base_id?
  end
end
