FactoryBot.define do
  factory :at_bat_batting_result do
    hit_id            {rand(1..5)}
    out_id            {rand(1..5)}
    time_base_id      {rand(1..5)}
    four_deadball_id  {rand(1..2)}
    point_id          {rand(1..4)}
  end
end
