class TracksController < ApplicationController
  def show
    client = SoundCloud.new(:client_id => '1da3190b0fddf388e8615a72180b3302')
    @track = client.get("/tracks/#{params[:id]}")
  end
end