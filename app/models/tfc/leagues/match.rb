class Tfc::Leagues::Match < ActiveRecord::Base
  # associations
  belongs_to :matchday
  belongs_to :home_team,  :class_name => 'Tfc::Leagues::Team'
  belongs_to :guest_team, :class_name => 'Tfc::Leagues::Team'

  # attributes
  attr_accessible :guest_team_id, :guest_team_score, :home_team_id, :home_team_score, :matchday_id, :played_at, :scheduled_at, :slug

  # callbacks
  after_initialize :set_defaults

  # validations
  validates :matchday, :presence => true
  validates :home_team, :presence => true
  validates :home_team_id, :uniqueness => { :scope => :matchday_id }

  def to_s
    "#{matchday} #{home_team} #{guest_team}"
  end # def

  private

  def set_defaults
    if self.new_record?
      # self.markup_language ||= Tfc::Leagues::Configuration.default_markup_language
    end # if
  end # def
end
