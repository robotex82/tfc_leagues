require 'tfc/leagues/active_admin/base'

ActiveAdmin.register Tfc::Leagues::Match do
  Tfc::Leagues::ActiveAdmin::Base.configure(self)

  form do |f|
    f.inputs do
      f.input :matchday
      f.input :scheduled_at
      f.input :played_at
    end

    f.inputs do
      f.input :home_team
      f.input :home_team_score
      f.input :guest_team
      f.input :guest_team_score
    end

    f.actions
  end # form
end if defined?(ActiveAdmin)
