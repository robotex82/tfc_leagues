class Tfc::Leagues::Matchday < ActiveRecord::Base
  # associations
  belongs_to :season
  has_many :matches, :dependent => :restrict

  # attributes
  attr_accessible :description, :markup_language, :sequential_number, :season_id, :slug

  # callbacks
  after_initialize :set_defaults

  # friendly id support
  extend FriendlyId
  friendly_id :sequential_number, :use => :slugged

  # markup support
  acts_as_markup :language => :variable,
                 :columns  => [ :description ]

  # validations
  validates :scheduled_at, :presence => true
  validates :season, :presence => true
  validates :sequential_number, :presence => true,
                                :uniqueness => { :scope => [ :season_id ] }

  def to_s
    "#{season} #{sequential_number}"
  end # def

  private

  def set_defaults
    if self.new_record?
      self.markup_language ||= Tfc::Leagues::Configuration.default_markup_language
    end # if
  end # def
end
