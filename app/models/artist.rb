class Artist < ApplicationRecord
	has_many :songs
	has_many :albums

	before_save :get_summary

	validates :name, presence: true, uniqueness: true


	private
	
	def get_summary
		summary =  LastFM::Artist.get_info(:artist => self.name)["artist"]["bio"]["summary"]
		if summary == nil
			self.summary = "No Bio Available"
		else 
			self.summary = summary
		end
	end


end
