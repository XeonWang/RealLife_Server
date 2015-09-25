# UserDA Test
require File.dirname(__FILE__) + '/../../AppConfiguration.rb'
require $APPLICATION_PATH + '/product/data_access/UserDA.rb'
require $APPLICATION_PATH + '/product/entity/User.rb'

class UserDATest

	def initialize
		@client = Mysql2::Client.new(:host => "localhost", :database => "reallife", :username => "root")
	end

	def testAddUser
		userDA = UserDA.new

		userId = userDA.getNextId
		userName = 'Jone'
		userPwd = '123'
		user = User.new(userId, userName, userPwd)
		
		userDA.addUser user

		dataFromDB = @client.query("SELECT name, password FROM Uzer WHERE id=#{userId}")
		if dataFromDB.first["name"] != userName
			raise puts __method__ + "Failed!" #caller_locations(1,1)[0].label
		end
	end

end

tester = UserDATest.new
tester.testAddUser