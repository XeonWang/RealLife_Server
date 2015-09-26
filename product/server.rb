require 'sinatra'
require './AppConfiguration.rb'
require $APPLICATION_PATH + '/entity/User'
require $APPLICATION_PATH + '/data_access/UserDA'

get "/" do
	"Hello World"
end

post "/user" do
	userDA = UserDA.new
	user = userDA.findByName(params[:username])
	unless user 
		user = User.new({:name=>userName, :password=>userPwd, :id=>nil})
		userDA.addUser user
	end
	
	user.to_hash.to_json
end