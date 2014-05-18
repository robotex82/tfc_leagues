class CreateTfcLeaguesPlayerLendings < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_player_lendings do |t|
      t.references :match
      t.references :source_team
      t.references :target_team
      t.references :player

      t.timestamps
    end
    add_index :tfc_leagues_player_lendings, :match_id
    add_index :tfc_leagues_player_lendings, :source_team_id
    add_index :tfc_leagues_player_lendings, :target_team_id
    add_index :tfc_leagues_player_lendings, :player_id
    add_index :tfc_leagues_player_lendings, [:match_id, :source_team_id, :target_team_id, :player_id],
              :unqiue => true,
              :name => 'index_tfc_leagues_player_lendings_on_all_ids'
  end
end
