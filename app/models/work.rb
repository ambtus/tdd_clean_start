class Work
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Versioning
  include Mongoid::Timestamps

  embeds_many :chapters
  references_many :identities, :stored_as => :array, :inverse_of => :identities
  references_many :users, :stored_as => :array, :inverse_of => :users

  field :title
end
