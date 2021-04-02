FactoryBot.define do
  factory :member do
    gimei = Gimei.new
    name              {gimei.last.kanji + gimei.first.kanji}
    uni_no            {rand(0..100)}
    dominant_hand_id  {rand(1..6)}
    position_id       {rand(1..7)}
    base_hist_id      {rand(1..4)}
    association       :team
    
    after(:build) do |member|
      member.mem_image.attach(io: File.open("public/images/sonbu.png"), filename: 'sonbu.png')
    end
  end
end
