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
Color.delete_all


red = Color.create(:name =>'Red', :hex => '#FF0000')
purple = Color.create(:name =>'Purple', :hex => '#DA70D6')
pink = Color.create(:name =>'Pink', :hex => '#FFB6C1')
Color.create(:name =>'Yellow', :hex => '#FFFF00')
Color.create(:name =>'Grey', :hex => '#808080')
green = Color.create(:name =>'Green', :hex => '#008000')
Color.create(:name =>'Blue', :hex => '#3D59AB')


homer = User.create( :username => 'Homer Simpson', :email => 'homer@example.org', :image_url => 'Homer.gif', :password => 'doh', :password_confirmation => 'doh' )
marge = User.create( :username => 'Marge Simpson', :email => 'marge@example.org', :image_url => 'marge.jpg', :password => 'grumble', :password_confirmation => 'grumble' )
bart = User.create( :username => 'Bart Simpson', :email => 'bart@example.org', :image_url => 'bart.png', :password => 'dude', :password_confirmation => 'dude' )
lisa = User.create( :username => 'Lisa Simpson', :email => 'lisa@example.org', :image_url => 'lisa.jpg', :password => 'stacy', :password_confirmation => 'stacy' )
monty = User.create( :username => 'Monty Burns', :email => 'monty@example.org', :image_url => 'monty.jpg', :password => 'excellent', :password_confirmation => 'excellent' )

moes = Community.create(:comm_name => "Moe's Tavern", :organizer => homer.id, :image_url=>'moes.jpg', :comm_category=> 'beer', :location =>'moes tavern', :description => '$1 Duff from 5pm to dawn', :color_id => red.hex)
quikEMart = Community.create(:comm_name => "Slushie lovers", :organizer => bart.id, :image_url=>'kwik-e-mart.png', :comm_category => 'slurpees', :location => 'Springfield', :description => 'Free slurpees very Wednesday with purchases over $20', :color_id => purple.hex)
school = Community.create(:comm_name => "Extra Credit", :organizer => lisa.id, :image_url => 'extracredit.jpg', :comm_category => 'study group', :location => 'classroom', :description => 'Future Leaders of America Unite!', :color_id => pink.hex)
nuclearPlant = Community.create(:comm_name => "Hail to the Thief", :organizer => monty.id, :image_url =>'training.jpg', :comm_category => 'work', :location => 'Power Plant', :description => 'Eeeexcellent', :color_id => green.hex)

brain_freeze = Event.create(:title => "Brain Freezathon", :location => quikEMart.location, :image_url =>'slurpee.PNG', :start_time => DateTime.new(2016,5,4,3,0), :end_time => DateTime.new(2016,5,4,4,0), :description => "gallon slurpees", :user_id => bart.id, :community_id => quikEMart.id, :event_category => "slurpees", :color => quikEMart.color_id)
spell = Event.create(:title => "Spelling Bee", :location => school.location, :image_url =>'spellingbee.gif', :start_time => DateTime.new(2016,5,12,15,30), :end_time => DateTime.new(2016,5,12,16,30), :description => "practice for spelling bee", :user_id => lisa.id, :community_id => school.id, :event_category => "bees", :color => school.color_id)
science = Event.create(:title => "Science Fair", :location => school.location, :image_url =>'sciencefair.jpg',:start_time => DateTime.new(2016,5,20,12,30), :end_time => DateTime.new(2016,5,20,16,30), :description => "science fair presentations", :user_id => homer.id, :community_id => school.id, :event_category => "science!", :color => school.color_id)
safety = Event.create(:title => "Safety Training", :location => nuclearPlant.location, :image_url =>'plant.png', :start_time => DateTime.new(2016,5,16,7,0), :end_time => DateTime.new(2016,5,16,9,0), :description => "safety regulations", :user_id => homer.id, :community_id => nuclearPlant.id, :event_category => "training", :color => nuclearPlant.color_id)

moes.events.create :title => "Duff Power Hour", :location => moes.location, :start_time => DateTime.new(2016,5,14,18,0), :end_time => DateTime.new(2016,5,14,21,0), :description => "duff beer special", :user_id => homer.id, :community_id => moes.id, :event_category => "beer", :color => moes.color_id


print "There are now #{User.count} users in the database.\n"
print "There are now #{Community.count} communitites in the database.\n"
print "There are now #{Event.count} events in the database.\n"
print "There are now #{Color.count} colors in the database.\n"
