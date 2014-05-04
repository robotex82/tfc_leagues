class Tfc::Leagues::TeamMembership < ActiveRecord::Base
  # associations
  belongs_to :team
  belongs_to :membershipable, :polymorphic => true

  # attributes
  attr_accessible :membershipable_id, :membershipable_type, :team_id

  # callbacks
  after_initialize :set_defaults

  # validations
  validates :membershipable, :presence => true
  validates :team,           :presence => true
  validates :team_id,        :uniqueness => { :scope => [ :membershipable_type, :membershipable_id ] }

  def to_s
    "#{team} #{membershipable}"
  end # def

  private

  def set_defaults
    if self.new_record?
    end # if
  end # def
end
