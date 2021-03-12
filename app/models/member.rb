class Member < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position
  belongs_to :base_hist
  belongs_to :dominant_hand

  with_options presence: true do
    validates :name,   uniqueness: true,     format: { with: /\A[ぁ-ん一-龥]+\z/ }
    validates :uni_no, uniqueness: true,     numericality: { in: 0..100 }
    validates :dominant_hand
    validates :position_id
  end

  belongs_to :team
  has_one_attached :mem_image, dependent: :destoroy
end
