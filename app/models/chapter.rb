class Chapter
  include Mongoid::Document

  embedded_in :work, :inverse_of => :chapter
end
