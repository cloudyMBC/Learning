class PlaylistsController < ApplicationController
	def show
		client = SoundCloud.new(:client_id => '1da3190b0fddf388e8615a72180b3302')
		@playlist = client.get("/playlists/#{params[:id]}")
	end 
end