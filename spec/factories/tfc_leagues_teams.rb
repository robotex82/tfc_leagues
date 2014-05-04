# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tfc_leagues_team, :class => 'Tfc::Leagues::Team' do
    association :club,   :factory => :tfc_leagues_club
    association :season, :factory => :tfc_leagues_season
    sequence(:sequential_number) { |i| i }
  end
end
