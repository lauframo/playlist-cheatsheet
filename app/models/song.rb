class Song < ApplicationRecord

	has_many :playlists, through :playlist_songs
end
