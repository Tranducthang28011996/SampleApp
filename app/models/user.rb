class User < ApplicationRecord
	has_secure_password
	attr_accessor :remmembertoken
	enum role: [ :customer, :admin ]
end
