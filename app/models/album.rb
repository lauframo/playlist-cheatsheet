class Album < ApplicationRecord
	belongs_to :artist
	has_many :songs

	before_save :get_data

	validates :name, presence: true, uniqueness: { scope: :artist_id }


	def get_data
		summary = LastFM::Album.get_info(artist: Artist.find_by(id: self.artist_id).name, album: self.name)["album"]

		if summary == nil || summary["wiki"] == nil 
			self.summary = "No Album Info Available"
		else
			self.summary = summary["wiki"]["summary"]
		end

		get_image(summary)
	end

	def get_image(summary)
		if summary == nil || summary["image"] == nil 
			self.image = "No Album Image Available"
		else
			self.image = summary["image"][2]["#text"]
		end

	end



end
