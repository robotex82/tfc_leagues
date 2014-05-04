class Tfc::Leagues::League < ActiveRecord::Base
  # associations
  belongs_to :federation
  has_many :seasons, :dependent => :restrict

  # attributes
  attr_accessible :description, :federation_id, :markup_language, :name, :slug

  # callbacks
  after_initialize :set_defaults

  # friendly id support
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # markup support
  acts_as_markup :language => :variable,
                 :columns  => [ :description ]

  # validations
  validates :federation, :presence => true
  validates :name, :presence   => true,
                   :uniqueness => { :scope => [ :federation_id ] }

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
