class PlaylistsController < ApplicationController
	include PlaylistsHelper

	def show 
		@playlist = Playlist.find_by(id: params[:id])
		@spotify_playlist =  RSpotify::Playlist.find(@playlist.username, @playlist.playlist_id)
		p @spotify_playlist

	end

	def new
		@playlist = Playlist.new
	end

	def create
		@playlist = Playlist.find_or_initialize_by(playlist_params)
		if @playlist.save
			redirect_to @playlist
		else
			render 'new'
		end
	end
end
