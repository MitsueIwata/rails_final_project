class Community < ActiveRecord::Base
	belongs_to :users
	has_many :events
end
