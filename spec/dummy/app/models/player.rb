class Player < ActiveRecord::Base
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
