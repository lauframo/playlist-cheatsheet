class Song < ApplicationRecord

	belongs_to :artist
	belongs_to :album
	has_many :playlist_songs
	has_many :playlists, through: :playlist_songs

	before_save :get_summary

	validates :name, presence: true, uniqueness: { scope: :artist_id }
	validates_presence_of :name, :artist_id, :album_id

	def view_summary
		self.summary.gsub(/\s\W[a-z]{1}\s\D*\W/, '.')
	end

	private

	def get_summary
		summary = LastFM::Track.get_info(artist: Artist.find_by(id: self.artist_id).name, track: self.name)["track"]["wiki"]
		if summary == nil
			self.summary = "No Song Info Available"
		else
			self.summary = summary["summary"]
		end
	end
end
