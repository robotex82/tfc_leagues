class CreateTfcLeaguesMatches < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_matches do |t|
      t.timestamp :scheduled_at
      t.timestamp :played_at
      t.references :matchday
      t.references :home_team
      t.integer :home_team_score
      t.references :guest_team
      t.integer :guest_team_score
      t.string :slug

      t.timestamps
    end
    add_index :tfc_leagues_matches, :matchday_id
    add_index :tfc_leagues_matches, :home_team_id
    add_index :tfc_leagues_matches, :guest_team_id
    add_index :tfc_leagues_matches, :slug, :unique => true
  end
end
