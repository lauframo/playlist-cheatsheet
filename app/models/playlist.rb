class Playlist < ApplicationRecord

	has_many :playlist_songs
	has_many :songs, through: :playlist_songs

	before_save :get_tracks

	validates_presence_of :username, :playlist_id
	validates_uniqueness_of :playlist_id, { scope: :username }

	private

	def spotify_playlist
		@spotify_playlist = RSpotify::Playlist.find(self.username, self.playlist_id)
		self.name = @spotify_playlist.name
		return @spotify_playlist
	end

	def get_tracks
		tracks = spotify_playlist.tracks
		tracks.each do |track|
			artist = Artist.find_or_create_by(name: track.artists.first.name)
			album = Album.find_or_create_by(name: track.album.name, artist_id: artist.id)
			self.songs << Song.find_or_create_by(name: track.name, artist_id: artist.id, album_id: album.id)
		end
	end



end
