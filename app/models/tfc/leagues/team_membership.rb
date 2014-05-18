class Tfc::Leagues::TeamMembership < ActiveRecord::Base
  # associations
  belongs_to :team
  belongs_to :player, :class_name => Tfc::Leagues::Configuration.player_class_name

  # attributes
  attr_accessible :player_id, :team_id

  # attributes for cascade select
  attr_accessor :federation, :league, :season
  attr_accessible :federation, :league, :season

  # callbacks
  after_initialize :set_defaults

  # validations
  validates :player,  :presence => true
  validates :team,    :presence => true
  validates :team_id, :uniqueness => { :scope => [ :player_id ] }

  def to_s
    "#{team} #{player}"
  end # def

  private

  def set_defaults
    if self.new_record?
    end # if
  end # def
end
