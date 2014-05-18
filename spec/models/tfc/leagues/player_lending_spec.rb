require 'spec_helper'

describe Tfc::Leagues::PlayerLending do
  describe 'associations' do
    it { should belong_to :match }
    it { should belong_to :source_team }
    it { should belong_to :target_team }
    it { should belong_to :player }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :match }
    it { should validate_presence_of :source_team }
    it { should validate_presence_of :target_team }
    it { should validate_presence_of :player }
    it { should validate_uniqueness_of(:player_id).scoped_to([ :match_id, :source_team_id, :target_team_id ]) }
  end # describe
end
