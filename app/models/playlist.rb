class Playlist < ApplicationRecord


	validates uniqueness: :playlist_id
	validates_presence_of :username, :playlist_id

	has_many :songs, through: :plalylist_songs

	def spotify_playlist
		@spotify_playlist = RSpotify::Playlist.find(self.username, self.playlist_id)
	end

	def get_tracks
		tracks = self.spotify_playlist.tracks
		tracks.each do |track|
			artist = Artist.find_or_create_by(name: track.artists.first.name)
			album = Album.find_or_create_by(name: track.album.name, artist_id: artist)
			Song.find_or_create_by(name: track.name, artist_id: artist, album_id: album)
		end
	end



end
