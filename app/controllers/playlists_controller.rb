class PlaylistsController < ApplicationController
	include PlaylistsHelper

	def show 
		@playlist = Playlist.find_by(id: params[:id])
	end

	def new
		@playlist = Playlist.new
	end

	def create
		@playlist = Playlist.find_or_initialize_by(playlist_params)
		if @playlist.save
			p "ya did it"
		else
			render 'new'
		end
	end
end
