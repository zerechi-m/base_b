class CreateBattingResults < ActiveRecord::Migration[6.0]
  def change
    create_table :batting_results do |t|
      t.integer :hit_id
      t.integer :out_id
      t.integer :time_base_id
      t.integer :point_id
      t.integer :four_deadball_id
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true
      t.references :member, foreign_key: true
      t.timestamps
    end
  end
end
