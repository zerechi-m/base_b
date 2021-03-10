class Member < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :uni_no
    validates :age
    validates :position_id
    validates :base_hist_id
  end

  belongs_to :team

end
