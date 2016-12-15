class Playlist < ApplicationRecord

	validates_uniqueness_of :playlist_id
	validates_presence_of :username, :playlist_id

end
