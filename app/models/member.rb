class Member < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :position
    belongs_to :base_hist

  with_options presence: true do
    validates :name,        format: {with: /\A[ぁ-ん一-龥]+\z/ }
    validates :uni_no,      numericality: {in: 0..100}
    validates :age,         numericality: {in: 18..80}
    validates :position_id
  end

  validates :base_hist_id

  belongs_to :team
  has_one_attached :image

end
