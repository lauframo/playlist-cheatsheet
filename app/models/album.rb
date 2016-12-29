class Album < ApplicationRecord
	belongs_to :artist
	has_many :songs

	before_save :get_summary

	validates :name, presence: true, uniqueness: { scope: :artist_id }


	def get_summary
		summary = LastFM::Album.get_info(artist: Artist.find_by(id: self.artist_id).name, album: self.name)
		if summary == nil || summary["album"]["wiki"] == nil
			self.summary = "No Album Info Available"
		else
			self.summary = summary["album"]["wiki"]["summary"]
		end
	end

end
