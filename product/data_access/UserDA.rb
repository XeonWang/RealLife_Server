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

	def findByName(name)
		results = @client.query("SELECT id, name, password FROM Uzer WHERE name='#{name.strip}'")
		user = User.new(results.first)
	end

	def retrieveFriends(userId)
		results = []
		friendsList = @client.query("SELECT friends FROM Uzer WHERE id = #{userId}")
		puts friendsList.count.to_s
		if friendsList and friendsList.first['friends'] != nil
			friendsList = @client.query("SELECT id, name FROM Uzer WHERE id in (#{friendsList.first['friends']})") 
			friendsList.each { |friend|
				results << User.new(friend)
			}
		end
		return results
	end

	def getMaxId
		result = @client.query("SELECT Max(id) FROM Uzer")
		return result.first.values[0]
	end

	def getNextId
		getMaxId.to_i + 1;
	end

end