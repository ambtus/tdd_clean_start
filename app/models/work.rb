class Work
  include Mongoid::Document

  embeds_many :chapters
  referenced_in :identity
  references_many :users, :stored_as => :array, :inverse_of => :works

  field :title
  field :chaptered, :type => Boolean
  field :complete, :type => Boolean

  accepts_nested_attributes_for :chapters, :allow_destroy => true
end
