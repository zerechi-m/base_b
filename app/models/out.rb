class Out < ActiveHash::Base
  self.data = [
    {id: 1, name: "三振"},
    {id: 2, name: "内ゴロ"},
    {id: 3, name: "内野飛"},
    {id: 4, name: "左飛"},
    {id: 5, name: "中飛"},
    {id: 6, name: "右飛"},
  ]

  include ActiveHash::Associations
  has_many :batting_results
end