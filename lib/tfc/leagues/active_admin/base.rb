module Tfc::Leagues::ActiveAdmin
  class Base
    def self.configure(resource)
      resource.menu :parent => Proc.new { I18n.t('tfc.leagues.active_admin.menu') }.call
    end
  end
end
