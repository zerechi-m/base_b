class CreateTeamGames < ActiveRecord::Migration[6.0]
  def change
    create_table :team_games do |t|
      t.references :team
      t.references :game
      t.timestamps
    end
  end
end
