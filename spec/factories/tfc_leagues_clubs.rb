# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tfc_leagues_club, :class => 'Tfc::Leagues::Club' do
    sequence(:name) { |i| "Club ##{i}" }
  end
end
