require 'sinatra'
require './AppConfiguration.rb'
require $APPLICATION_PATH + '/entity/User'
require $APPLICATION_PATH + '/data_access/UserDA'

get "/" do
	"Hello World"
end

post "/user" do
	userDA = UserDA.new
	user = User.new(params[:username], params[:password])
	userDA.addUser user
	user.to_hash.to_json
end