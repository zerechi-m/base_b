class Hit < ActiveHash::Base
  self.data = [
    {id: 1, name: "内野安"},
    {id: 2, name: "左安"},
    {id: 3, name: "中安"},
    {id: 4, name: "右安"},
    {id: 5, name: "右安"},
    {id: 6, name: "左2"},
    {id: 7, name: "中2"},
    {id: 8, name: "右2"},
    {id: 9, name: "左3"},
    {id: 10, name: "中3"},
    {id: 11, name: "右3"},
    {id: 12, name: "本塁打"},

  ]

  include ActiveHash::Associations
  has_many :batting_results
end