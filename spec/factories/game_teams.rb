FactoryBot.define do
  factory :game_team do
    association :game
    association :team
  end
end