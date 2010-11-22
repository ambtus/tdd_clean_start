class Person
  include Mongoid::Document

  devise :database_authenticatable, :trackable, :timeoutable, :lockable, :recoverable, :registerable, :confirmable, :validatable

  attr_accessible :email, :password, :password_confirmation

end
