class Tfc::Leagues::Federation < ActiveRecord::Base
  # associations
  has_many :leagues, :dependent => :restrict

  # attributes
  attr_accessible :description, :markup_language, :name, :slug

  # callbacks
  after_initialize :set_defaults

  # friendly id support
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # markup support
  acts_as_markup :language => :variable,
                 :columns  => [ :description ]

  # validations
  validates :name, :presence   => true,
                   :uniqueness => true

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
