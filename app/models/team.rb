class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, length: { in: 4..15 }, uniqueness: {case_sensitive: false }
    validates :rep_name, length: { minimum: 2, maximum: 8 }, format: { with: /\A[ぁ-んァ-ヶ々一-龥]+\z/ }
  end
  validates :password, 
      format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字の混合で入力してください'},
      length: {minimum: 6, maximum: 10, message: 'は6文字以上10文字以下で設定してください'}

  has_many :members, dependent: :destroy

  has_many :room_teams
  has_many :rooms, through: :room_teams
  has_many :messages, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :team_games
  has_many :games, through: :team_games
  has_many :orders
  has_many :batting_results
end
