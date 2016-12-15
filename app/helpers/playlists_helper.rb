module PlaylistsHelper

	def playlist_params
		params.require(:playlist).permit(:username, :playlist_id)
	end

end
