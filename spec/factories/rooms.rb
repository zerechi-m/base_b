FactoryBot.define do
  factory :room do
    gimei = Gimei.new
    name {gimei.prefecture.kanji + gimei.first.hiragana}
  end
end
