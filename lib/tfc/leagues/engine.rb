module Tfc
  module Leagues
    class Engine < ::Rails::Engine
      initializer :tfc_leagues_engine do |application|
        ::ActiveAdmin.setup do |config|
          config.load_paths << File.expand_path('../active_admin/resources', __FILE__)
          config.register_javascript 'tfc_leagues.js'
          config.register_stylesheet 'tfc_leagues.css'
        end # ActiveAdmin.setup
      end # intializer

      initializer :append_migrations do |application|
        # Append migrations to the application
        unless application.root.to_s == root.to_s
          application.config.paths["db/migrate"] += config.paths["db/migrate"].expanded
        end
      end # initializer
    end # class Engine
  end # module Leagues
end # module Tfc
