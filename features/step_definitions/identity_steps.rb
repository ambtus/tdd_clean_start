Given /^there is an identity "([^\"]*)"$/ do |name|
  Identity.create!(:name => name)
end

Given /^I have an identity "([^\"]*)"$/ do |name|
  i = Identity.create(:name => name)
  u = User.where(:email => 'someone@example.com').first
  u.identities << i
end
