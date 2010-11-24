class Chapter
  include Mongoid::Document

  embedded_in :work, :inverse_of => :chapter

  field :chapter_name
  field :content
end
