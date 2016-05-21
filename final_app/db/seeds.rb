# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Community.delete_all
Event.delete_all
Calendar.delete_all

homer = User.create( :username => 'Homer Simpson', :email => 'homer@example.org', :password => 'doh' )
marge = User.create( :username => 'Marge Simpson', :email => 'marge@example.org', :password => 'grumble' )
bart = User.create( :username => 'Bart Simpson', :email => 'bart@example.org', :password => 'dude' )
lisa = User.create( :username => 'Lisa Simpson', :email => 'lisa@example.org', :password => 'stacy' )
monty = User.create( :username => 'Monty Burns', :email => 'monty@example.org', :password => 'excellent' )

moes = Community.create(:comm_name => "Happy Hour", :organizer => homer.id, :comm_category=> 'beer', :location =>'moes tavern')
quikEMart = Community.create(:comm_name => "Free Slushie Tuesday", :organizer => bart.id, :comm_category => 'slushies', :location => 'Springfield')
school = Community.create(:comm_name => "Model UN", :organizer => lisa.id, :comm_category => 'study group', :location => 'classroom')
nuclearPlant = Community.create(:comm_name => "Hail to the Thief", :organizer => monty.id, :comm_category => 'work', :location => 'Power Plant')

print "There are now #{User.count} users in the database.\n"
print "There are now #{Community.count} communitites in the database.\n"
