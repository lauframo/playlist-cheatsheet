class Song < ApplicationRecord

	belongs_to :artists
	belongs_to :albums
	has_many :playlists, through: :playlist_songs

	validates :name, presence: true, uniqueness: { scope: :artist_id }

	def summary
		track_summary = LastFM::Track.get_info(artist: track.artists.first.name, track: self.name)["track"]
		if track_summary["wiki"]
			self.summary = track_summary["wiki"]["summary"]
		end
	end
end
