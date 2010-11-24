class Identity
  include Mongoid::Document

  field :name

  referenced_in :user
  references_many :works
end
