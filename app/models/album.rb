class Album < ApplicationRecord
	belongs_to :artist
	has_many :songs

	before_save :get_summary

	validates :name, presence: true, uniqueness: { scope: :artist_id }

	private

	def get_summary
		summary = LastFM::Album.get_info(artist: Artist.find_by(id: self.artist_id).name, album: self.name)["album"]["wiki"]
		if summary == nil 
			self.summary = "No Album Info Available"
		else
			self.summary = summary["summary"]
		end
	end

end
