FactoryBot.define do
  factory :message do
    gimei = Gimei.new
    content     {Faker::Lorem.sentence}
    game_day    {Faker::Date.backward.strftime("%Y-%m-%d")}
    game_time   {Faker::Time.forward(days: 5,  period: :evening, format: :long)}
    address     {gimei.address.kanji + rand(9).to_s + "-" + rand(9).to_s + "-" + rand(30).to_s}
    stadium     {gimei.prefecture.kanji + "スタジアム"}
    association :team
    association :room
  end
end
