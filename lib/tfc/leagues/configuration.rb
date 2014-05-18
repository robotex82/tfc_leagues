require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Tfc
  module Leagues
    module Configuration
      def configure
        yield self
      end # def

      mattr_accessor :default_markup_language
      @@default_markup_language = nil

      mattr_accessor :markup_languages
      @@markup_languages = []

      mattr_accessor :player_class_name
      @@person_class_name = 'Player'

      def self.player_class_name=(class_name)
        raise PlayerClassNotDefinedError unless Object.const_defined?(class_name)
        @@player_class_name = class_name.constantize
      end # def
    end # module Configuration
  end # module Leagues
end # module Tfc
