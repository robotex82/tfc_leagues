require 'tfc/leagues/active_admin/base'

ActiveAdmin.register Tfc::Leagues::League do
  Tfc::Leagues::ActiveAdmin::Base.configure(self)

  collection_action :seasons_for_select do
    @items = Tfc::Leagues::League.find(params[:id]).seasons
    sleep(1)
    render 'cascade_select/options_for_select', :layout => false
  end

  form do |f|
    f.inputs do
      f.input :federation
      f.input :name
    end

    f.inputs do
      f.input :description
      f.input :markup_language, :as => :select, :collection => Tfc::Leagues::Configuration.markup_languages.map(&:to_s)
    end

    f.actions
  end # form
end if defined?(ActiveAdmin)
