class CreateTfcLeaguesTeams < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_teams do |t|
      t.integer :sequential_number
      t.text :description
      t.string :markup_language
      t.string :slug
      t.references :club
      t.references :season

      t.timestamps
    end
    add_index :tfc_leagues_teams, :club_id
    add_index :tfc_leagues_teams, :season_id
    add_index :tfc_leagues_teams, :slug, :unique => true
  end
end
