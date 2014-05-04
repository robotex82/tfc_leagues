module Foo
  class ResourceGenerator < Rails::Generators::Base
    desc "Generates an enhanced active admin resource"

    source_root File.expand_path('../templates', __FILE__)

    argument :model_name, :type => :string

    def generate_resource
      template "active_admin_base.rb", File.join(engine_root, "lib", engine_namespace.underscore, "active_admin", "base.rb"), :engine_namespace => engine_namespace, :i18n_namespace => i18n_namespace
      template "active_admin_resource.rb", File.join(engine_root, "lib", engine_namespace.underscore, "active_admin", "resources", target_filename), :engine_namespace => engine_namespace, :model_name => model_name
    end

    private

    def engine_root
      File.join Rails.root, "..", ".."
    end

    def engine_namespace
      model_name.deconstantize
    end

    def target_filename
      "#{model_name.underscore.gsub('/', '_').pluralize}.rb"
    end

    def i18n_namespace
      engine_namespace.underscore.gsub("/", ".")
    end
  end
end
