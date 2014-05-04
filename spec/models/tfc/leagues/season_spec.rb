require 'spec_helper'

describe Tfc::Leagues::Season do
  describe 'associations' do
    it { should belong_to :league }
    it { should have_many :matchdays }
    it { should have_many :teams }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :league }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to(:league_id) }
  end # describe
end
