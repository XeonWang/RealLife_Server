# The base entity.

require_relative 'addons/ActiveRecordExtension'
require 'json'
class Entity
	include ActiveRecordExtension

	def initialize(entityHash)
		entityHash.keys.each do |key|
			instance_variable_set "@#{key}", entityHash[key]
			self.class.send :attr_accessor, key.to_sym
		end
	end
end