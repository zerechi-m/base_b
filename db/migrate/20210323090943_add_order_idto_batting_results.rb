class AddOrderIdtoBattingResults < ActiveRecord::Migration[6.0]
  def change
    add_reference :batting_results, :order, foreign_key: true
  end
end
