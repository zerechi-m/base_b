FactoryBot.define do
  factory :result do
    gimei = Gimei.new
    win                 { gimei.prefecture.kanji + gimei.first.hiragana }
    lose                { gimei.prefecture.kanji + gimei.first.hiragana  }
    batting_first       { gimei.prefecture.kanji + gimei.first.hiragana }
    fielding_first      { gimei.prefecture.kanji + gimei.first.hiragana }
    batting_first_point { 10 }
    fielding_first_point{ 0 }
    association :game
  end 
end
