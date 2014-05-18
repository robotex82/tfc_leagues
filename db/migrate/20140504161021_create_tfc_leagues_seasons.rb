class CreateTfcLeaguesSeasons < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_seasons do |t|
      t.string :name
      t.text :description
      t.string :markup_language
      t.string :slug
      t.references :league

      t.timestamps
    end
    add_index :tfc_leagues_seasons, :league_id
    add_index :tfc_leagues_seasons, :slug, :unique => true
  end
end
