class User < ActiveRecord::Base
	has_many :communities

	has_many :events
	has_many :comments
	has_secure_password

end
