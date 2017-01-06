class PlaylistsController < ApplicationController
	include PlaylistsHelper

	def index
		@playlist = Playlist.new
		# @playlist = Playlist.find_by(username: params[:username], playlist_id: [params:playlist_id])
		# p @playlist
		# redirect_to @playlist, id: @playlist.id
	end

	def search
		p params
		@playlist = Playlist.find_by(username: params[:username], playlist_id: params[:playlist_id])
		p @playlist
		redirect_to @playlist, id: @playlist.id
	end

	def show 
		@playlist = Playlist.find_by(id: params[:id])
		p @playlist
	end


	def new
		@playlist = Playlist.new
	end

	def create
		@playlist = Playlist.new(playlist_params)
		if @playlist.save
			redirect_to @playlist
		else
			render 'new'
		end
	end
end
