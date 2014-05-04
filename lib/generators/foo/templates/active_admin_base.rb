module <%= engine_namespace %>::ActiveAdmin
  class Base
    def self.configure(resource)
      resource.menu :parent => Proc.new { I18n.t('<%= i18n_namespace %>.active_admin.menu') }.call
    end
  end
end
