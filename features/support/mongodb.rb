Given "an empty database" do
  ::Mongoid.database.collections.each {|c| c.remove}
end

Given "the seeds are loaded" do
  load "#{Rails.root}/db/seeds.rb"
end
