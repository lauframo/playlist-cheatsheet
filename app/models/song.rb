class Song < ApplicationRecord

	belongs_to :artists
	belongs_to :albums
	has_many :playlists, through :playlist_songs

	validates :name, presence: true, uniqueness: { scope: :artist_id }
end
