class DominantHand < ActiveHash::Base
  self.data = [
    { id: 1, name: '右投/右打' },
    { id: 2, name: '右投/左打' },
    { id: 3, name: '右投/両打' },
    { id: 4, name: '左投/左打' },
    { id: 5, name: '左投/右打' },
    { id: 6, name: '左投/両打' }
  ]
  
  include ActiveHash::Associations
  has_many :members
end
