# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tfc_leagues_team_membership, :class => 'Tfc::Leagues::TeamMembership' do
    association :team,           :factory => :tfc_leagues_team
    association :player,         :factory => :player
  end
end
