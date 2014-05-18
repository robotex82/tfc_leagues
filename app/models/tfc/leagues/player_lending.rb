class Tfc::Leagues::PlayerLending < ActiveRecord::Base
  # associations
  belongs_to :match
  belongs_to :source_team, :class_name => 'Tfc::Leagues::Team'
  belongs_to :target_team, :class_name => 'Tfc::Leagues::Team'
  belongs_to :player, :class_name => Tfc::Leagues::Configuration.player_class_name

  # attributes
  attr_accessible :match_id,
                  :player_id,
                  :source_team_id,
                  :target_team_id

  # callbacks
  after_initialize :set_defaults

  # validations
  validates :match, :presence => true
  validates :source_team, :presence => true
  validates :target_team, :presence => true
  validates :player, :presence => true
  validates :player_id, :uniqueness => { :scope => [ :match_id, :source_team_id, :target_team_id  ] }

  def to_s
    id
  end # def

  private

  def set_defaults
    if self.new_record?
      # self.markup_language ||= Tfc::Leagues::Configuration.default_markup_language
    end # if
  end # def
end
