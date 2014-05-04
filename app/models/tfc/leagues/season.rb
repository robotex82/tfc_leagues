class Tfc::Leagues::Season < ActiveRecord::Base
  # associations
  belongs_to :league
  has_many :matchdays, :dependent => :restrict
  has_many :teams, :dependent => :restrict

  # attributes
  attr_accessible :description, :league_id, :markup_language, :name, :slug

  # callbacks
  after_initialize :set_defaults

  # friendly id support
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # markup support
  acts_as_markup :language => :variable,
                 :columns  => [ :description ]

  # validations
  validates :league, :presence => true
  validates :name,   :presence => true,
                     :uniqueness => { :scope => [ :league_id ] }

  def to_s
    name
  end # def

  private

  def set_defaults
    if self.new_record?
      self.markup_language ||= Tfc::Leagues::Configuration.default_markup_language
    end # if
  end # def
end
