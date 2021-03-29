class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.integer :uni_no, null: false
      t.integer :dominant_hand_id, null: false
      t.integer :position_id, null:false
      t.integer :base_hist_id
      t.references :team, foreign_key: true
      t.timestamps
    end
  end
end

