Given /^there is an identity "([^\"]*)"$/ do |name|
  Identity.create!(:name => name)
end
