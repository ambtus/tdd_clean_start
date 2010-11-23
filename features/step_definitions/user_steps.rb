Given /^I am logged out$/ do
  visit destroy_user_session_path
end

Given /^I am logged in$/ do
  email = 'someone@example.com'
  password = 'secret'

  Given %{There is a user "#{email}" with password "#{password}"}
  visit new_user_session_path
  fill_in("user_email", :with => "#{email}")
  fill_in("user_password", :with => "#{password}")
  click_button("Sign in")
end

Given /^There is a user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  p = User.create(:email => email, :password => password)
  p.confirmed_at = Time.now
  p.save!
end
