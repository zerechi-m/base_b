class Member < ApplicationRecord
  before_validation :delete_space

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position
  belongs_to :base_hist
  belongs_to :dominant_hand

  with_options presence: true do
    validates :name,     format: { with: /\A[ぁ-んァ-ヶ々一-龥]+\z/, message: 'にアルファベット・記号は使用できません' }, 
                         length: { minimum: 2, maximum: 8}

    validates :uni_no,     numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100, only_integer: true}
    validates :dominant_hand
    validates :position_id

  end

  belongs_to :team
  has_many :batting_results
  has_one_attached :mem_image, dependent: :destoroy

  private
  def delete_space
    self.name = name.gsub(/[[:space:]]/,"") unless self.name.blank?
  end
end
