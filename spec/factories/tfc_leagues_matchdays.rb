# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tfc_leagues_matchday, :class => 'Tfc::Leagues::Matchday' do
    association :season, :factory => :tfc_leagues_season
    sequence(:sequential_number) { |i| i }
    scheduled_at Time.zone.now + 1.month
  end
end
