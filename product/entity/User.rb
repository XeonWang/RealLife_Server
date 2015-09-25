# User Entity

class User
	def initialize(id, name, password)
		@id = id
		@name = name
		@password = password
	end
	
	attr_accessor :id
	attr_accessor :name
	attr_accessor :password
end