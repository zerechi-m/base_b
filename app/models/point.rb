class Point < ActiveHash::Base
  self.data = [
    {id: 1, name: 1},
    {id: 2, name: 2},
    {id: 3, name: 3},
    {id: 4, name: 4}
  ]
  include ActiveHash::Associations
  has_many :batting_results
end