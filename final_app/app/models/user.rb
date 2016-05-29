class User < ActiveRecord::Base
	has_many :communities

	has_many :events
	# , :through => :communities
	has_many :comments
	has_secure_password

end
