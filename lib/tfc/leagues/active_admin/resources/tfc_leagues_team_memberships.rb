require 'tfc/leagues/active_admin/base'
# require 'tfc/leagues/formtastic/inputs/tfc_leagues_team_select_input'

ActiveAdmin.register Tfc::Leagues::TeamMembership do
  Tfc::Leagues::ActiveAdmin::Base.configure(self)

  form do |f|
    f.inputs do
      f.input :federation, :as         => :cascade_select,
                           :collection => Tfc::Leagues::Federation.all,
                           :next       => :tfc_leagues_team_membership_league,
                           :url        => leagues_for_select_admin_tfc_leagues_federations_path
      f.input :league, :as         => :cascade_select,
                       :collection => [],
                       :next       => :tfc_leagues_team_membership_season,
                       :url        => seasons_for_select_admin_tfc_leagues_leagues_path
      f.input :season, :as         => :cascade_select,
                       :collection => [],
                       :next       => :tfc_leagues_team_membership_team_id,
                       :url        => teams_for_select_admin_tfc_leagues_seasons_path
      f.input :team, :as         => :cascade_select
      #f.input :team
      f.input :player, :as => :select, :collection => Tfc::Leagues::Configuration.player_class_name.constantize.all
    end

    f.actions
  end # form
end if defined?(ActiveAdmin)
