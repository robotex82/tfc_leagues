# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tfc_leagues_player_lending, :class => 'Tfc::Leagues::PlayerLending' do
    association :match,       :factory => :tfc_leagues_match
    association :source_team, :factory => :tfc_leagues_team
    association :target_team, :factory => :tfc_leagues_team
    association :player,      :factory => :player
  end
end
