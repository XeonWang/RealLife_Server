require_relative 'Entity'

class Action < Entity
	def initialize(dbAction)
		dbAction.keys.each do |key|
			instance_variable_set "@#{key}", dbAction[key]
			self.class.send :attr_accessor, key.to_sym
		end
	end
end