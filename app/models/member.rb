class Member < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :position
    belongs_to :base_hist

  with_options presence: true do
    validates :name
    validates :uni_no
    validates :age
    validates :position_id
    validates :base_hist_id
  end

  belongs_to :team
  has_one_attached :image

end
