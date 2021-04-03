FactoryBot.define do
  factory :team do
    gimei = Gimei.new
    name                    {gimei.prefecture.kanji + gimei.first.hiragana} 
    rep_name                {gimei.last.kanji + gimei.first.kanji}
    email                   {Faker::Internet.email}
    password                {Faker::Internet.password(min_length: 5, max_length: 9) + rand(9).to_s}
    password_confirmation   {password}
  end
end