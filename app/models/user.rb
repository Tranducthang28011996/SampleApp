class User < ApplicationRecord
	has_secure_password
	attr_accessor :remmembertoken
	enum role: [ :customer, :admin ]
  belongs_to :product
  has_many :reviews
end
