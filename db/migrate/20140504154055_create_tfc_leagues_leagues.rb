class CreateTfcLeaguesLeagues < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_leagues do |t|
      t.string :name
      t.text :description
      t.string :markup_language
      t.string :slug
      t.references :federation

      t.timestamps
    end
    add_index :tfc_leagues_leagues, :name
    add_index :tfc_leagues_leagues, :slug, :unique => true
    add_index :tfc_leagues_leagues, :federation_id
  end
end
