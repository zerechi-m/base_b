class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '投手' },
    { id: 2, name: '捕手' },
    { id: 3, name: '一塁手' },
    { id: 4, name: '二塁手' },
    { id: 5, name: '三塁手' },
    { id: 6, name: '遊撃手' },
    { id: 7, name: '外野手' },
    { id: 8, name: 'レフト' },
    { id: 9, name: 'センター' },
    { id: 10, name: 'ライト' },
  ]

  include ActiveHash::Associations
  has_many :members
end
