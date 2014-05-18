require 'spec_helper'

describe Tfc::Leagues::Match do
  describe 'associations' do
    it { should belong_to :matchday }
    it { should belong_to :home_team }
    it { should belong_to :guest_team }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :matchday }
    it { should validate_presence_of :home_team }
    it { should validate_uniqueness_of(:home_team_id).scoped_to(:matchday_id) }
  end # describe
end
