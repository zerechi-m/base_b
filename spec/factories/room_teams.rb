FactoryBot.define do
  factory :room_team do
    association :team
    association :room
  end
end