class CreateAtBats < ActiveRecord::Migration[6.0]
  def change
    create_table :at_bats do |t|
      t.references :member, foreign_key: true
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true
      t.references :batting_result, foreign_key: true
      t.timestamps
    end
  end
end
