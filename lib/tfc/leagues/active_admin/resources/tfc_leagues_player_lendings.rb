require 'tfc/leagues/active_admin/base'

ActiveAdmin.register Tfc::Leagues::PlayerLending do
  Tfc::Leagues::ActiveAdmin::Base.configure(self)
end if defined?(ActiveAdmin)
