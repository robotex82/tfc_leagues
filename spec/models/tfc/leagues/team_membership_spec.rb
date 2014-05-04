require 'spec_helper'

describe Tfc::Leagues::TeamMembership do
  describe 'associations' do
    it { should belong_to :team }
    it { should belong_to :membershipable }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :team }
    it { should validate_presence_of :membershipable }
    # it { should validate_uniqueness_of(:team_id).scoped_to(:membershipable_type, :membershipable_id) }
  end # describe
end
