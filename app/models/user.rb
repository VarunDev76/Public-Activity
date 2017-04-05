class User < ApplicationRecord
	include PublicActivity::Model
  	# binding.pry
  	tracked  
	has_many :recipes ,dependent: :destroy
end
