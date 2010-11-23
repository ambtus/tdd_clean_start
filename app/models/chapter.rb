class Chapter
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Versioning
  include Mongoid::Timestamps

  embedded_in :work, :inverse_of => :chapter
end
