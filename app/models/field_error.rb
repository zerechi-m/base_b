class FieldError < ActiveHash::Base
  self.data = [
    {id: 1, name: "内野失"},
    {id: 2, name: "外野失"},
    {id: 3, name: "捕失"},
  ]

  include ActiveHash::Associations
  has_many :batting_results
end