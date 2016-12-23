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
			puts "artist: #{track.artists.first.name}"
			puts "album: #{track.album.name}"
			puts "song: #{track.name}"
			artist = Artist.find_or_create_by(name: track.artists.first.name)
			album = Album.find_or_create_by(name: track.album.name, artist_id: artist.id)
			song = Song.find_or_create_by(name: track.name, artist_id: artist.id, album_id: album.id)
		end
	end



end
