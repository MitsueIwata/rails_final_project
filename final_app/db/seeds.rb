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
Comment.delete_all

homer = User.create( :username => 'Homer Simpson', :email => 'homer@example.org', :image_url => 'Homer.gif', :password => 'doh', :password_confirmation => 'doh' )
marge = User.create( :username => 'Marge Simpson', :email => 'marge@example.org', :image_url => 'marge.jpg', :password => 'grumble', :password_confirmation => 'grumble' )
bart = User.create( :username => 'Bart Simpson', :email => 'bart@example.org', :image_url => 'bart.png', :password => 'dude', :password_confirmation => 'dude' )
lisa = User.create( :username => 'Lisa Simpson', :email => 'lisa@example.org', :image_url => 'lisa.jpg', :password => 'stacy', :password_confirmation => 'stacy' )
monty = User.create( :username => 'Monty Burns', :email => 'monty@example.org', :image_url => 'monty.jpg', :password => 'excellent', :password_confirmation => 'excellent' )

moes = Community.create(:comm_name => "Moe's Tavern", :organizer => homer.id, :comm_category=> 'beer', :location =>'moes tavern', :description => '$1 Duff from 5pm to dawn')
quikEMart = Community.create(:comm_name => "Slushie lovers", :organizer => bart.id, :comm_category => 'slushies', :location => 'Springfield', :description => 'Every Wednesday with purchases over $20')
school = Community.create(:comm_name => "Extra Credit", :organizer => lisa.id, :comm_category => 'study group', :location => 'classroom', :description => 'Future Leaders of America Unite!')
nuclearPlant = Community.create(:comm_name => "Hail to the Thief", :organizer => monty.id, :comm_category => 'work', :location => 'Power Plant', :description => 'Eeeexcellent')

brain_freeze = Event.create(:title => "Brain Freezathon", :location => quikEMart.location, :start_time => DateTime.new(2016,5,4,3,0), :end_time => DateTime.new(2016,5,4,4,0), :description => "gallon slushies", :user_id => bart.id, :community_id => quikEMart.id, :event_category => "slushies", :url => "http://fullcalendar.io/")
duff_days = Event.create(:title => "Duff Power Hour", :location => moes.location, :start_time => DateTime.new(2016,5,14,18,0), :end_time => DateTime.new(2016,5,14,21,0), :description => "duff beer special", :user_id => homer.id, :community_id => moes.id, :event_category => "beer")
spell = Event.create(:title => "Spelling Bee", :location => school.location, :start_time => DateTime.new(2016,5,12,15,30), :end_time => DateTime.new(2016,5,12,16,30), :description => "practice for spelling bee", :user_id => lisa.id, :community_id => school.id, :event_category => "bees")
science = Event.create(:title => "Science Fair", :location => school.location, :start_time => DateTime.new(2016,5,20,12,30), :end_time => DateTime.new(2016,5,20,16,30), :description => "science fair presentations", :user_id => homer.id, :community_id => school.id, :event_category => "science!")
safety = Event.create(:title => "Safety Training", :location => nuclearPlant.location, :start_time => DateTime.new(2016,5,16,7,0), :end_time => DateTime.new(2016,5,16,9,0), :description => "safety regulations", :user_id => homer.id, :community_id => nuclearPlant.id, :event_category => "training")


print "There are now #{User.count} users in the database.\n"
print "There are now #{Community.count} communitites in the database.\n"
print "There are now #{Event.count} events in the database.\n"

