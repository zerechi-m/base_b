class FourDeadball < ActiveHash::Base
  self.data = [
    {id: 1, name: "四球"},
    {id: 2, name: "死球"}
  ]

  include ActiveHash::Associations
  has_many :batting_results
end