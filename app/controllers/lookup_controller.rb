# require 'json'
# require 'open-uri'

# class LookupController < ApplicationController
# 	def index

# 		@username = params['username']
# 		response = open("http://api.soundcloud.com/users/#{@username}.json?client_id=1da3190b0fddf388e8615a72180b3302").read
# 		parsed   = JSON.parse(response)
# 		@country = parsed['country']
# 	end
# end

require 'soundcloud'

class LookupController < ApplicationController
	def index
		@username = params['username']
		client = SoundCloud.new(:client_id => '1da3190b0fddf388e8615a72180b3302')
		begin
			user = client.get("/users/#{@username}")
		rescue SoundCloud::ResponseError
			@city = nil
			@country = nil
		else
			@city = user.city
			@country = user.country
		end
	end
end