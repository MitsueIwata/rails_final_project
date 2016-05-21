class User < ActiveRecord::Base
	# has_many :communities
	has_secure_password

end
