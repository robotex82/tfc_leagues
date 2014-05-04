require '<%= engine_namespace.underscore %>/active_admin/base'

ActiveAdmin.register <%= model_name %> do
  <%= engine_namespace %>::ActiveAdmin::Base.configure(self)
end if defined?(ActiveAdmin)
