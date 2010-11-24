class Work
  include Mongoid::Document

  embeds_many :chapters
  referenced_in :identity
  references_many :users, :stored_as => :array, :inverse_of => :works

  field :title
end
