# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'date'

User.delete_all
Community.delete_all
Event.delete_all
Calendar.delete_all

homer = User.create( :username => 'Homer Simpson', :email => 'homer@example.org', :image_url => 'Homer.gif', :password => 'doh', :password_confirmation => 'doh' )
marge = User.create( :username => 'Marge Simpson', :email => 'marge@example.org', :image_url => 'marge.jpg', :password => 'grumble', :password_confirmation => 'grumble' )
bart = User.create( :username => 'Bart Simpson', :email => 'bart@example.org', :image_url => 'bart.png', :password => 'dude', :password_confirmation => 'dude' )
lisa = User.create( :username => 'Lisa Simpson', :email => 'lisa@example.org', :image_url => 'lisa.jpg', :password => 'stacy', :password_confirmation => 'stacy' )
monty = User.create( :username => 'Monty Burns', :email => 'monty@example.org', :image_url => 'monty.jpg', :password => 'excellent', :password_confirmation => 'excellent' )

moes = Community.create(:comm_name => "Happy Hour", :organizer => homer.id, :comm_category=> 'beer', :location =>'moes tavern')
quikEMart = Community.create(:comm_name => "Free Slushies", :organizer => bart.id, :comm_category => 'slushies', :location => 'Springfield')
school = Community.create(:comm_name => "Model UN", :organizer => lisa.id, :comm_category => 'study group', :location => 'classroom')
nuclearPlant = Community.create(:comm_name => "Hail to the Thief", :organizer => monty.id, :comm_category => 'work', :location => 'Power Plant')




print "There are now #{User.count} users in the database.\n"
print "There are now #{Community.count} communitites in the database.\n"
