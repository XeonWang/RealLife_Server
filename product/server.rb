require 'sinatra'
require './AppConfiguration.rb'
require $APPLICATION_PATH + '/entity/User'
require $APPLICATION_PATH + '/entity/Action'
require $APPLICATION_PATH + '/data_access/UserDA'

get "/" do
	"Hello World"
end

post "/user" do
	userDA = UserDA.new
	user = userDA.findByName(params[:username])
	unless user != nil
		user = User.new({:name=>params[:username], :password=>params[:password], :id=>nil})
		userDA.addUser user
	end

	user.to_hash.to_json
end

get "/user/:userId/friends" do
	userDA = UserDA.new
	friends = userDA.retrieveFriends params[:userId]
	friendsHash = Array.new
	friends.each { |friend| friendsHash << friend.to_hash }
	return friendsHash.to_json
end

get "/user/:userId/image" do
	send_file './image/head1.jpg',
	  :type => 'image/jpeg',
	  :disposition => 'inline'
end

post "/user/:userId/actions" do
	userDA = UserDA.new
	actions = userDA.retrieveActions params[:userId]
	actionsHash = Array.new
	actions.each { |action|  actionsHash << action.to_hash}
	return actionsHash.to_json
end