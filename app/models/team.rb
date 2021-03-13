class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, length: { in: 4..20 }, uniqueness: true
    validates :rep_name, length: { minimum: 2, maximum: 15 }, format: { with: /\A[ぁ-んヶ々一-龥]+\z/ }
  end

  has_many :members, dependent: :destroy

  has_many :room_teams
  has_many :rooms, through: :room_teams
  has_one_attached :image, dependent: :destroy
end
