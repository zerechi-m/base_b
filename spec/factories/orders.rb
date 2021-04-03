FactoryBot.define do
  factory :order do
    batting_order {rand(1..9)}
    position_id   {rand(1..10)}
    association  :game
    association  :team
  end
end

