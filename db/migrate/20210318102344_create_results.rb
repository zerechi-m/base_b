class CreateResults < ActiveRecord::Migration[6.0]

  def change
    create_table :results do |t|
      t.string  :win
      t.string  :lose
      t.string  :batting_first
      t.string  :fielding_first
      t.integer :batting_first_point
      t.integer :fielding_first_point
      t.references :game
      t.timestamps 
    end
  end

end
