# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tfc_leagues_federation, :class => 'Tfc::Leagues::Federation' do
    sequence(:name) { |i| "Federation ##{i}" }
  end
end
