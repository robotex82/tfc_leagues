require 'spec_helper'

describe Tfc::Leagues::League do
  describe 'associations' do
    it { should belong_to :federation }
    it { should have_many :seasons }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :federation }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to(:federation_id) }
  end # describe
end
