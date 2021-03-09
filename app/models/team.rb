class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, uniquness: true, length: {in: 4..20}
    validates :rep_name, length: {maximum: 15}, format: { with: /\A[ぁ-ん一-龥]+\z/ }
  end
end
