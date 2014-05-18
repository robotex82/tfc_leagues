class CreateTfcLeaguesClubs < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_clubs do |t|
      t.string :name
      t.text :description
      t.string :markup_language
      t.string :slug

      t.timestamps
    end
    add_index :tfc_leagues_clubs, :name, :unique => true
    add_index :tfc_leagues_clubs, :slug, :unique => true
  end
end
