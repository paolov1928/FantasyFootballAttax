class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :user, foreign_key: true
      t.string :yourTeam
      t.string :opponentTeam
      t.boolean :won

      t.timestamps
    end
  end
end
