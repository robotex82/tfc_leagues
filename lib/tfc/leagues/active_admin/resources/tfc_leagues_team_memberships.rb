require 'tfc/leagues/active_admin/base'

ActiveAdmin.register Tfc::Leagues::TeamMembership do
  Tfc::Leagues::ActiveAdmin::Base.configure(self)

  form do |f|
    f.inputs do
      f.input :team
      f.input :membershipable_id, :as => :select, :collection => Tfc::Leagues::Configuration.membershipable_class_name.constantize.all.collect { |p| [ p, p.id ] }
      f.input :membershipable_type, :as => :hidden, :input_html => { :value => Tfc::Leagues::Configuration.membershipable_class_name  }
    end

    f.actions
  end # form
end if defined?(ActiveAdmin)
