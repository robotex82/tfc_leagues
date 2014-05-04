module Tfc
  module Leagues
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the intializer"

        source_root File.expand_path('../templates', __FILE__)

        def generate_intializer
          copy_file "tfc_leagues.rb", "config/initializers/tfc_leagues.rb"
        end
      end
    end
  end
end      
