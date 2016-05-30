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
green = Color.create(:name =>'Green', :hex => '#008000')
blue = Color.create(:name =>'Blue', :hex => '#3D59AB')
Color.create(:name =>'Yellow', :hex => '#FFFF00')
Color.create(:name =>'Grey', :hex => '#808080')
Color.create(:name =>'Aquamarine', :hex => '#7FFFD4')
Color.create(:name =>'Orange', :hex => '#FF8C00')
Color.create(:name =>'Emerald', :hex => '#50C878')
Color.create(:name =>'Light Blue', :hex => '#9BDDFF')


homer = User.create( :username => 'Homer Simpson', :email => 'homer@example.org', :image_url => 'Homer.gif', :password => 'doh', :password_confirmation => 'doh' )
marge = User.create( :username => 'Marge Simpson', :email => 'marge@example.org', :image_url => 'marge.jpg', :password => 'grumble', :password_confirmation => 'grumble' )
bart = User.create( :username => 'Bart Simpson', :email => 'bart@example.org', :image_url => 'bart.png', :password => 'dude', :password_confirmation => 'dude' )
lisa = User.create( :username => 'Lisa Simpson', :email => 'lisa@example.org', :image_url => 'lisa.jpg', :password => 'stacy', :password_confirmation => 'stacy' )
monty = User.create( :username => 'Monty Burns', :email => 'monty@example.org', :image_url => 'monty.jpg', :password => 'excellent', :password_confirmation => 'excellent' )
apu = User.create( :username => 'Apu Nahasapeemapetilon', :email => 'apu@example.org', :image_url => 'apu.jpg', :password => 'thankyou', :password_confirmation => 'thankyou' )


moes = Community.create(:comm_name => "Moe's Tavern", :organizer => homer.id, :image_url=>'moes.jpg', :comm_category=> 'beer', :location =>'moes tavern', :description => 'A place to see barney drink himself stupid. NO KIDS!', :color_id => red.hex)
quikEMart = Community.create(:comm_name => "Squishee lovers", :organizer => apu.id, :image_url=>'squishee.png', :comm_category => 'squishee', :location => 'Springfield', :description => 'Free squishee very Wednesday with purchases over $20', :color_id => purple.hex)
school = Community.create(:comm_name => "Extra Credit", :organizer => lisa.id, :image_url => 'extracredit.jpg', :comm_category => 'study group', :location => 'classroom', :description => 'Future Leaders of America Unite!', :color_id => pink.hex)
nuclearPlant = Community.create(:comm_name => "Hail to the Thief", :organizer => monty.id, :image_url =>'training.jpg', :comm_category => 'work', :location => 'Power Plant', :description => 'Eeeexcellent', :color_id => green.hex)
krusty = Community.create(:comm_name => "Krusty Fan Club", :organizer => bart.id, :image_url =>'krusty.png', :comm_category => 'krusty', :location => "Bart's Treehouse", :description => 'Everything Krusty', :color_id => blue.hex)

brain_freeze = Event.create(:title => "Brain Freezathon", :location => quikEMart.location, :image_url =>'slurpee.PNG', :start_time => DateTime.new(2016,5,4,3,0), :end_time => DateTime.new(2016,5,4,4,0), :description => "gallon squishees", :user_id => bart.id, :community_id => quikEMart.id, :event_category => "squishees", :color => quikEMart.color_id)
spell = Event.create(:title => "Spelling Bee", :location => school.location, :image_url =>'spellingbee.gif', :start_time => DateTime.new(2016,5,12,15,30), :end_time => DateTime.new(2016,5,12,16,30), :description => "practice for spelling bee", :user_id => lisa.id, :community_id => school.id, :event_category => "bees", :color => school.color_id)
science = Event.create(:title => "Science Fair", :location => school.location, :image_url =>'sciencefair.jpg',:start_time => DateTime.new(2016,5,20,12,30), :end_time => DateTime.new(2016,5,20,16,30), :description => "science fair presentations", :user_id => homer.id, :community_id => school.id, :event_category => "science!", :color => school.color_id)
safety = Event.create(:title => "Safety Training", :location => nuclearPlant.location, :image_url =>'plant.png', :start_time => DateTime.new(2016,5,16,7,0), :end_time => DateTime.new(2016,5,16,9,0), :description => "safety regulations", :user_id => homer.id, :community_id => nuclearPlant.id, :event_category => "training", :color => nuclearPlant.color_id)
moes.events.create :title => "Duff Power Hour", :location => moes.location, :image_url => 'duff.jpg', :start_time => DateTime.new(2016,5,14,18,0), :end_time => DateTime.new(2016,5,14,21,0), :description => "duff beer special", :user_id => homer.id, :community_id => moes.id, :event_category => "beer", :color => moes.color_id
krusty.events.create :title => "Trip to Krusty Burger", :location => "krusty burger", :image_url => 'Krusty_Burgers.png', :start_time => DateTime.new(2016,5,29,18,0), :end_time => DateTime.new(2016,5,28,21,0), :description => "Let's eat as many burgers as we can!", :user_id => homer.id, :community_id => krusty.id, :event_category => "beer", :color => krusty.color_id

brain_freeze.comments.create :date => DateTime.new(2016,5,12,19,30), :user_id => lisa.id, :content => "Bart, you look like an idiot"
brain_freeze.comments.create :date => DateTime.new(2016,5,12,21,30), :user_id => bart.id, :content => "Lisa, eat my shorts"
science.comments.create :date => DateTime.new(2016,5,11,8,30), :user_id => bart.id, :content => "Lisa's a nerd!"
spell.comments.create :date => DateTime.new(2016,5,15,10,30), :user_id => marge.id, :content => "I'm so proud of you!"
safety.comments.create :date => DateTime.new(2016,5,19,11,30), :user_id => monty.id, :content => "Training hours not compensated"
safety.comments.create :date => DateTime.new(2016,5,19,12,30), :user_id => homer.id, :content => "Doh!"


print "There are now #{User.count} users in the database.\n"
print "There are now #{Community.count} communitites in the database.\n"
print "There are now #{Event.count} events in the database.\n"
print "There are now #{Color.count} colors in the database.\n"
print "There are now #{Comment.count} comments in the database.\n"
