# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tfc_leagues_league, :class => 'Tfc::Leagues::League' do
    association :federation, :factory => :tfc_leagues_federation
    sequence(:name) { |i| "League ##{i}" }
  end
end
