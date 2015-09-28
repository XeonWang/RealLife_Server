# UserDA Test
require File.dirname(__FILE__) + '/../../product/AppConfiguration.rb'
require $APPLICATION_PATH + '/data_access/UserDA.rb'
require $APPLICATION_PATH + '/entity/User.rb'

class UserDATest

	def initialize
		@client = Mysql2::Client.new(:host => "localhost", :database => "reallife", :username => "root")
		@userDA = UserDA.new
	end

	def testAddUser
		userName = 'Test1'
		userPwd = '123'
		user = User.new({:name=>userName, :password=>userPwd, :id=>nil})
		
		@userDA.addUser user

		dataFromDB = @client.query("SELECT name, password FROM Uzer WHERE id=#{user.id}")
		if dataFromDB.first["name"] != userName
			raise __method__ + "Failed!" #caller_locations(1,1)[0].label
		end
		@client.query("DELETE FROM Uzer WHERE id=#{user.id}")

		puts "#{__method__} test successfully."
	end

	def testRetrieveFriends
		friends = @userDA.retrieveFriends(1)
		if friends.size <= 0
			raise __method__ + "Failed!"
		end

		if friends[0].id != 1
			raise __method__ + "Failed!"
		end
		puts "#{__method__} test successfully."
	end

end

tester = UserDATest.new
tester.testAddUser
tester.testRetrieveFriends