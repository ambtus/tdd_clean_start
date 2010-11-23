class Identity
  include Mongoid::Document

  referenced_in :person

  field :name

end
