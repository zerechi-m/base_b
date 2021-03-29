class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :batting_order
      t.integer :position_id
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true
      t.references :member, foreign_key: true
      t.timestamps
    end
  end
end
