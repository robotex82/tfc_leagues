class CreateTfcLeaguesMatchdays < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_matchdays do |t|
      t.integer :sequential_number
      t.text :description
      t.string :markup_language
      t.string :slug
      t.references :season

      t.timestamps
    end
    add_index :tfc_leagues_matchdays, :slug, :unique => true
    add_index :tfc_leagues_matchdays, :season_id
  end
end
