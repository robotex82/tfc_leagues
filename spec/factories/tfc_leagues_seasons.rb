# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tfc_leagues_season, :class => 'Tfc::Leagues::Season' do
    association :league, :factory => :tfc_leagues_league
    sequence(:name) { |i| "Season ##{i}" }
  end
end
