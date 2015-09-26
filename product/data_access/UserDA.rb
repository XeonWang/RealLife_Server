# Data access for User

require 'Mysql2'

class UserDA

	def initialize
		@client = Mysql2::Client.new(:host => "localhost", :database => "reallife", :username => "root")
	end

	def addUser(user)
		user.id = getNextId
		results = @client.query("INSERT INTO Uzer(id, name, password) VALUES(#{user.id}, '#{user.name}', '#{user.password}')")
		return user
	end

	def getMaxId
		result = @client.query("SELECT Max(id) FROM Uzer")
		return result.first.values[0]
	end

	def getNextId
		getMaxId.to_i + 1;
	end

end