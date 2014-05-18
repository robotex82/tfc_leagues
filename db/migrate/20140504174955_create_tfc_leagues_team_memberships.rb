class CreateTfcLeaguesTeamMemberships < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_team_memberships do |t|
      t.references :team
      t.references :player

      t.timestamps
    end
    add_index :tfc_leagues_team_memberships, :team_id
    add_index :tfc_leagues_team_memberships, :player_id
  end
end
