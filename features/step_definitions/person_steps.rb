Given /^I am logged in$/ do
  email = 'someone@example.com'
  password = 'secret'

  Given %{I have a person "#{email}" with password "#{password}"}
  visit new_person_session_path
  fill_in("person_email", :with => "#{email}")
  fill_in("person_password", :with => "#{password}")
  click_button("Sign in")
end

Given /^I have a person "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  p = Person.create(:email => email, :password => password)
  p.confirmed_at = Time.now
  p.save!
end
