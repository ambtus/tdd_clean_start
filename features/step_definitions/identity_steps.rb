Given /^there is an identity "([^\"]*)"$/ do |name|
  Identity.create!(:name => name)
end

Given /^I have an identity "([^\"]*)"$/ do |name|
  i = Identity.create(:name => name)
  p = Person.where(:email => 'someone@example.com').first
  p.identities << i
end
