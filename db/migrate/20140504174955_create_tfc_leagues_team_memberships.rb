class CreateTfcLeaguesTeamMemberships < ActiveRecord::Migration
  def change
    create_table :tfc_leagues_team_memberships do |t|
      t.references :team
      t.references :membershipable, :polymorphic => true

      t.timestamps
    end
    add_index :tfc_leagues_team_memberships, :team_id
    add_index :tfc_leagues_team_memberships, [ :membershipable_type, :membershipable_id ], :name => 'index_tfc_leagues_team_memberships_on_membershipable_type_and_id'
  end
end
