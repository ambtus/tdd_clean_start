class Person
  include Mongoid::Document

  devise :database_authenticatable, :trackable, :lockable, :recoverable, :registerable, :confirmable, :validatable, :rememberable

  attr_accessible :email, :password, :password_confirmation

  references_many :identities

end
