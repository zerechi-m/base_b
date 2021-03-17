class CreateRoomTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :room_teams do |t|
      t.references :team, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
