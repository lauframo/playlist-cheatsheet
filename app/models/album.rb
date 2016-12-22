class Album < ApplicationRecord

	validates :name, presence: true, uniqueness: { scope: :artist_id }

	belongs_to :artist
	has_many :songs

end
