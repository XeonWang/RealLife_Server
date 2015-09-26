# User Entity

require_relative 'Entity'

class User < Entity
	def initialize(dbUser)
		dbUser.keys.each do |key|
			instance_variable_set "@#{key}", dbUser[key]
			self.class.send :attr_accessor, key.to_sym
		end
	end
end