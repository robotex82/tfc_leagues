Tfc::Leagues.configure do |config|
  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ markdown rdoc textile ]
  config.markup_languages = %w[ markdown rdoc textile ]

  # Default markup language
  #
  # default: config.default_markup_language = 'textile'
  config.default_markup_language = 'textile'

  # Membershipable class
  #
  # default: config.membershipable_class_name = 'Player'
  config.membershipable_class_name = 'Player'
end
