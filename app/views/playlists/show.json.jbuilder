@songs = @playlist.songs 

json.array! @songs do |song|
	json.title song.name
	json.artist song.artist.name
	json.album song.album.name
end

