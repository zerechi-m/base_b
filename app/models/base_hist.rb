class BaseHist < ActiveHash::Base
  self.data = [
    {id: 1, name: "特になし"},
    {id: 2, name: "中学野球"},
    {id: 3, name: "高校野球"},
    {id: 4, name: "大学野球"},
    {id: 5, name: "実業団野球"},
  ]
  
  include ActiveHash::Associations
    has_many :members
end