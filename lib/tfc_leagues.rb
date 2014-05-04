require 'acts_as_markup'
require 'friendly_id'

require 'tfc/leagues/engine'
require 'tfc/leagues/configuration'
require 'tfc/leagues/routing'

module Tfc
  module Leagues
    extend Configuration

    def self.table_name_prefix
      'tfc_leagues_'
    end
  end # module Leagues
end # module Tfc
