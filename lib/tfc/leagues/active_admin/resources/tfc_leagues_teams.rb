require 'tfc/leagues/active_admin/base'

ActiveAdmin.register Tfc::Leagues::Team do
  Tfc::Leagues::ActiveAdmin::Base.configure(self)

  form do |f|
    f.inputs do
      f.input :club
      f.input :season, :as => :select, :collection => option_groups_from_collection_for_select(Tfc::Leagues::League.all, :seasons, :to_s, :id, :to_s)
      f.input :sequential_number
    end

    f.inputs do
      f.input :description
      f.input :markup_language, :as => :select, :collection => Tfc::Leagues::Configuration.markup_languages.map(&:to_s)
    end

    f.actions
  end # form
end if defined?(ActiveAdmin)
