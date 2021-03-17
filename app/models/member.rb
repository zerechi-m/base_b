class Member < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position
  belongs_to :base_hist
  belongs_to :dominant_hand

  with_options presence: true do
    validates :name,     format: { with: /\A[ぁ-んヶ々一-龥]+\z/ }
    validates :uni_no,     numericality: { in: 0..100 }
    validates :dominant_hand
    validates :position_id

  end

  belongs_to :team
  has_one_attached :mem_image, dependent: :destoroy
end
