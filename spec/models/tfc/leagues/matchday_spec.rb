require 'spec_helper'

describe Tfc::Leagues::Matchday do
  describe 'associations' do
    it { should belong_to :season }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :season }
    it { should validate_presence_of :sequential_number }
    it { should validate_uniqueness_of(:sequential_number).scoped_to(:season_id) }
  end # describe
end
