class Artist < ApplicationRecord
	has_many :songs
	has_many :albums

	before_save :get_summary

	validates :name, presence: true, uniqueness: true

	def view_summary
		self.summary.gsub(/\s\W[a-z]\s.*\W/, '')
	end


	private
	
	def get_summary
		info = LastFM::Artist.get_info(:artist => self.name)
		summary =  info["artist"]["bio"]["summary"]
		if summary == nil
			self.summary = "No Bio Available"
		else 
			self.summary = summary
		end

		self.image = info["artist"]["image"][2]["#text"]
	end


end
