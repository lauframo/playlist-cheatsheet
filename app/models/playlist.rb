class Playlist < ApplicationRecord

	has_many :songs, through: :plalylist_songs

	validates_presence_of :username, :playlist_id
	validates :playlist_id, uniqueness: true


	def spotify_playlist
		@spotify_playlist = RSpotify::Playlist.find(self.username, self.playlist_id)
	end

	def get_tracks
		tracks = self.spotify_playlist.tracks
		tracks.each do |track|
			artist = Artist.find_or_create_by(name: track.artists.first.name)
			p artist
			p "-------"
			album = Album.find_or_create_by(name: track.album.name, artist_id: artist.id)
			p album
			p "--------"
			p track.album.name
			p album.name
			p album.summary
			p album.errors.full_messages
			# Song.find_or_create_by(name: track.name, artist_id: artist, album_id: album)
		end
	end



end
