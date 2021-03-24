class AtBatBattingResult
  include ActiveModel::Model
  attr_accessor :batting_result_id, :team_id, :game_id, :member_id, :hit_id, :out_id, :time_base_id, :point_id, :four_deadball_id, :order_id, :pitcher_id, :away_team_id


  validates :hit_id, presence: true, unless: :hit?
  validates :out_id, presence: true, unless: :out?
  validates :time_base_id, presence: true, unless: :time_base?
  validates :four_deadball_id, presence: true, unless: :four_deadball?

  def save
    batting_result = BattingResult.create(hit_id: hit_id, out_id: out_id, time_base_id: time_base_id, four_deadball_id: four_deadball_id, game_id: game_id, team_id: team_id, member_id: member_id, order_id: order_id)
    AtBat.create(member_id: pitcher_id, team_id: away_team_id, game_id: game_id, batting_result_id: batting_result.id )
  end
  
  private 
  
  def hit?
    self.out_id.present? || self.time_base_id.present? || self.four_deadball_id.present?
  end
  def out? 
    self.hit_id.present? || self.time_base_id.present? || self.four_deadball_id.present?
  end
  def time_base?
    self.hit_id.present? || self.out_id.present? || self.four_deadball_id.present?
  end
  def four_deadball? 
    self.hit_id.present? || self.out_id.present? || self.time_base_id.present?
  end
end