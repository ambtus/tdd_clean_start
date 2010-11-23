# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Admin.create(:email => 'admin@example.com')
a = Admin.first
a.send_reset_password_instructions
a.confirmed_at = Time.now
a.save!
