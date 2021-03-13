class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content, null: false
      t.date :game_day
      t.string :address
      t.references :room, foreign_key: true
      t.references :team, foreign_key: true
      t.timestamps
    end
  end
end
