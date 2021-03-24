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
  belongs_to :team

# at_bat_batting_result.rb : form_objectを使用

end