class Recipe < ApplicationRecord
	include PublicActivity::Model
  	# binding.pry
  	tracked  owner: Proc.new{ |controller, model| model && model.user }
  	attr_accessor :name 
	belongs_to :user
	has_many :comments , dependent: :destroy
end
