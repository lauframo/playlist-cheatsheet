class Playlist < ApplicationRecord


	validates_uniqueness_of :playlist_id
	validates_presence_of :username, :playlist_id

	has_many :songs, through: :plalylist_songs

	def spotify_playlist
		@spotify_playlist = RSpotify::Playlist.find(self.username, self.playlist_id)
	end

	def get_tracks
		tracks = self.spotify_playlist.tracks
		tracks.each do |track|
			Song.create(name: track.name)
		end
	end



end
