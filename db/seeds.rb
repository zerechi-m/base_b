# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# チーム1の選手登録 -------------

member1 = Member.create( name: "孫権", uni_no: 1, position_id: 1, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 1)
  member1.mem_image.attach(io: File.open("public/images/sonken.png"), filename: "sonken.png")

member2 = Member.create(name: "足利義輝", uni_no: 2, position_id: 2, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 1)
  member2.mem_image.attach(io: File.open("public/images/yoshiteru.png"), filename: "yoshiteru.png") 

member3 = Member.create(name: "徳川吉宗", uni_no: 3, position_id: 3, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 1)
  member3.mem_image.attach(io: File.open("public/images/yoshimune.png"), filename: "yoshimune.png") 

member4 = Member.create(name: "蘇我馬子", uni_no: 4, position_id: 4, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 1)
  member4.mem_image.attach(io: File.open("public/images/umako.png"), filename: "umako.png") 
  
member5 = Member.create(name: "陸奥宗光", uni_no: 5, position_id: 5, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 1)
  member5.mem_image.attach(io: File.open("public/images/munemitsu.png"), filename: "munemitsu.png") 

member6 = Member.create(name: "雪舟", uni_no: 6, position_id: 6, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 1)
  member6.mem_image.attach(io: File.open("public/images/sessyu.png"), filename: "sessyu.png") 

member7 = Member.create(name: "天草四郎", uni_no: 7, position_id: 7, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 1)
  member7.mem_image.attach(io: File.open("public/images/shirou.png"), filename: "shirou.png") 

member8 = Member.create(name: "岩崎弥太郎", uni_no: 8, position_id: 7, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 1)
  member8.mem_image.attach(io: File.open("public/images/yotarou.png"), filename: "yotarou.png") 

member9 = Member.create(name: "達磨大師", uni_no: 9, position_id: 7, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 1)
  member9.mem_image.attach(io: File.open("public/images/taishi.png"), filename: "taishi.png")   



  

# チーム2の選手登録 -------------

member10 = Member.create( name: "徳川慶喜", uni_no: 1, position_id: 1, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 2)
  member10.mem_image.attach(io: File.open("public/images/yoshinobu.png"), filename: "yoshinobu.png")

member11 = Member.create( name: "柳生十兵衛", uni_no: 2, position_id: 2, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 2)
  member11.mem_image.attach(io: File.open("public/images/juubee.png"), filename: "juubee.png")

member12 = Member.create( name: "渋沢栄一", uni_no: 3, position_id: 3, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 2)
  member12.mem_image.attach(io: File.open("public/images/eiichi.png"), filename: "eiichi.png")

member13 = Member.create( name: "滝廉太郎", uni_no: 4, position_id: 4, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 2)
  member13.mem_image.attach(io: File.open("public/images/rentarou.png"), filename: "rentarou.png")

member14 = Member.create( name: "森鴎外", uni_no: 5, position_id: 5, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 2)
  member14.mem_image.attach(io: File.open("public/images/moriougai.png"), filename: "moriougai.png")

member15 = Member.create( name: "岩倉具視", uni_no: 6, position_id: 6, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 2)
  member15.mem_image.attach(io: File.open("public/images/tomomi.png"), filename: "tomomi.png")

member16 = Member.create( name: "孫武", uni_no: 7, position_id: 7, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 2)
  member16.mem_image.attach(io: File.open("public/images/sonbu.png"), filename: "sonbu.png")

member17 = Member.create( name: "加藤清正", uni_no: 8, position_id: 7, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 2)
  member17.mem_image.attach(io: File.open("public/images/kiyomasa.png"), filename: "kiyomasa.png")

member18 = Member.create( name: "大村益次郎", uni_no: 9, position_id: 7, dominant_hand_id: rand(1..5), base_hist_id: rand(1..4), team_id: 2)
  member18.mem_image.attach(io: File.open("public/images/masujirou.png"), filename: "masujirou.png")