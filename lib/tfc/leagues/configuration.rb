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

      mattr_accessor :membershipable_class_name
      @@person_class_name = 'Player'

      def self.membershipable_class_name=(class_name)
        raise MembershipableClassNotDefinedError unless Object.const_defined?(class_name)
        @@membershipable_class_name = class_name.constantize
      end # def
    end # module Configuration
  end # module Leagues
end # module Tfc
