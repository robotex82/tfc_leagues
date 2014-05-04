require 'spec_helper'

describe Tfc::Leagues::Federation do
  describe 'associations' do
    it { should have_many :leagues }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end # describe
end # describe
