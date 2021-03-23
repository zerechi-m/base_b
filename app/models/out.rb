class Out < ActiveHash::Base
  self.data = [
    {id: 1, name: "内ゴロ"},
    {id: 2, name: "内飛"},
    {id: 3, name: "左飛"},
    {id: 4, name: "中飛"},
    {id: 5, name: "右飛"},
  ]

  include ActiveHash::Associations
  has_many :batting_results
end