class CreateBattingResults < ActiveRecord::Migration[6.0]
  def change
    create_table :batting_results do |t|
      t.integer :hit_id
      t.integer :time_base_id
      t.integer :steal
      t.integer :point
      t.integer :four_ball
      t.integer :dead_ball
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true
      t.references :member, foreign_key: true
      t.timestamps
    end
  end
end
