class Player < ActiveRecord::Base
  has_many :team_memberships, :as => :membershipable,
                              :class_name => 'Tfc::Leagues::TeamMembership'

  attr_accessible :email, :firstname, :lastname

  validates :firstname, :lastname, :email, :presence => true
  validates :email, :uniqueness => true

  def to_s
    fullname
  end

  def fullname
    "#{firstname} #{lastname}"
  end
end
