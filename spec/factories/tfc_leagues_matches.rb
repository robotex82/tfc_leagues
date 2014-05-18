# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tfc_leagues_match, :class => 'Tfc::Leagues::Match' do
    association :matchday,  :factory => :tfc_leagues_matchday
    association :home_team, :factory => :tfc_leagues_team
  end
end
