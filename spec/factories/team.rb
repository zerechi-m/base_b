FactoryBot.define do
  factory :team do
    name                    {Gimei.last} 
    rep_name                {Gimei.last.kanji + Gimei.first.kanji}
    email                   
    password
    password_confirmation
  end
end