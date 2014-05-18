require 'spec_helper'

describe Tfc::Leagues::Team do
  describe 'associations' do
    it { should belong_to :club }
    it { should belong_to :season }
    it { should have_many :home_matches }
    it { should have_many :guest_matches }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :club }
    it { should validate_presence_of :season }
    it { should validate_presence_of :sequential_number }
    it { should validate_uniqueness_of(:sequential_number).scoped_to(:club_id, :season_id) }
  end # describe
end
