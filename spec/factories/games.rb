FactoryBot.define do
  factory :game do
    gimei = Gimei.new
    game_day    {Faker::Date.backward.strftime("%Y-%m-%d")}
    game_time   {Faker::Time.forward(days: 5,  period: :evening, format: :long)}
    address     {gimei.address.kanji + rand(9).to_s + "-" + rand(9).to_s + "-" + rand(30).to_s}
    stadium     {gimei.prefecture.kanji + "スタジアム"}
  end
end
