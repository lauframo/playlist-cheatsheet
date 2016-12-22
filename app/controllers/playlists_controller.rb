class PlaylistsController < ApplicationController
	include PlaylistsHelper

	def show 
		@playlist = Playlist.find_by(id: params[:id])
		@spotify_playlist =  RSpotify::Playlist.find(@playlist.username, @playlist.playlist_id)
		@tracks = @spotify_playlist.tracks
	end

	def new
		@playlist = Playlist.new
	end

	def create
		@playlist = Playlist.find_or_initialize_by(playlist_params)
		if @playlist.save
			@spotify_playlist = @playlist.spotify_playlist
			@tracks = @playlist.get_tracks
			p @spotify_playlist
			p @tracks
		else
			render 'new'
		end
	end
end
