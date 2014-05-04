require 'tfc/leagues/active_admin/base'

ActiveAdmin.register Tfc::Leagues::Federation do
  Tfc::Leagues::ActiveAdmin::Base.configure(self)

  form do |f|
    f.inputs do
      f.input :name
    end

    f.inputs do
      f.input :description
      f.input :markup_language, :as => :select, :collection => Tfc::Leagues::Configuration.markup_languages.map(&:to_s)
    end

    f.actions
  end # form
end if defined?(::ActiveAdmin)
