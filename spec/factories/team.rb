FactoryBot.define do
  factory :team do
    gimei = Gimei.new
    name                    {gimei.prefecture.kanji + gimei.first.hiragana} 
    rep_name                {gimei.last.kanji + gimei.first.kanji}
    email                   {Faker::Internet.email}
    password                {Faker::Internet.password(min_length: 6, max_length: 12)}
    password_confirmation
  end
end