class Admin
  include Mongoid::Document

  devise :database_authenticatable, :trackable, :timeoutable, :lockable, :recoverable, :registerable

  attr_accessible :email, :password, :password_confirmation
  validates_presence_of   :email
  validates_uniqueness_of :email, :case_sensitive => false

  field :activated

  def self.first_time
    return true if Admin.count == 1 && Admin.first.reset_password_token
  end
  def self.first_login
    return true if Admin.count == 1 && !Admin.first.reset_password_token && Admin.first.email == "admin@example.com"
  end
end
