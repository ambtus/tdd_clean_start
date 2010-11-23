class Identity
  include Mongoid::Document
  include Mongoid::Paranoia

  field :name

  referenced_in :user
  references_many :works, :stored_as => :array, :inverse_of => :identities
end
