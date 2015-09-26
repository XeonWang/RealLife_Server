# User Entity

require_relative 'Entity'

class User < Entity
	def initialize(name, password)
		@name = name
		@password = password
	end
	
	attr_accessor :id
	attr_accessor :name
	attr_accessor :password
end