# User Entity

class User
	def initialize(name, password)
		@name = name
		@password = password
	end
	
	attr_accessor :id
	attr_accessor :name
	attr_accessor :password
end