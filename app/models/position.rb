class Position < ActiveHash::Base
  self.data = [
    {id: 1, name: "----"},
    {id: 2, name: "投手"},
    {id: 3, name: "捕手"},
    {id: 4, name: "一塁手"},
    {id: 5, name: "二塁手"},
    {id: 6, name: "三塁手"},
    {id: 7, name: "遊撃手"},
    {id: 8, name: "外野手"},
    {id: 9, name: "DH"},
  ]

  include ActiveHash::Associations
  has_many :members
end