module Tfc
  module Leagues
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Copies the locale files to your application"

        source_root File.expand_path('../../../../../../config/locales', __FILE__)

        def generate_locales
          copy_file "en.yml", "config/locales/tfc.leagues.en.yml"
          copy_file "de.yml", "config/locales/tfc.leagues.de.yml"
        end
      end
    end
  end
end

