class PlaylistsController < ApplicationController
	include PlaylistsHelper

	def index
		@playlist = Playlist.new
	end

	def search
		@playlist = Playlist.find_by(username: params[:username], playlist_id: params[:playlist_id])
		if @playlist
			redirect_to @playlist
		else
			@errors = ["Username or playlist not found"]
			render 'index'
		end

	end

	def show 
		@playlist = Playlist.find_by(id: params[:id])
	end


	def new
		@playlist = Playlist.new
	end

	def create
		@playlist = Playlist.new(playlist_params)
		if @playlist.save
			redirect_to @playlist
		else
			p @playlist.errors.full_messages
			@errors = @playlist.errors.full_messages
			render 'new'
		end
	end
end
