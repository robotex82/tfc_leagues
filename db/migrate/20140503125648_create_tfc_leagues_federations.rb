class CreateTfcLeaguesFederations < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_federations do |t|
      t.string :name
      t.text :description
      t.string :markup_language
      t.string :slug

      t.timestamps
    end
    add_index :tfc_leagues_federations, :name, :unique => true
    add_index :tfc_leagues_federations, :slug, :unique => true
  end
end
