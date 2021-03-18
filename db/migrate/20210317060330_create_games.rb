class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.date :game_day, null: false
      t.time :game_time, null: false
      t.string :stadium, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
