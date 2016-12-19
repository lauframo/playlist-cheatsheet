class Playlist < ApplicationRecord

	validates_uniqueness_of :playlist_id
	validates_presence_of :username, :playlist_id

	def spotify_playlist
		@spotify_playlist = RSpotify::Playlist.find(self.username, self.playlist_id)
	end

end
