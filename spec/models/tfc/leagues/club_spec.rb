require 'spec_helper'

describe Tfc::Leagues::Club do
  describe 'associations' do
    it { should have_many :teams }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end # describe
end
