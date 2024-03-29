require 'spec_helper'

describe Player do
  describe 'associations' do
    it { should have_many :team_memberships }
  end # describe

  describe 'validations' do
    it { should validate_presence_of :firstname }
    it { should validate_presence_of :lastname }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end # describe
end
