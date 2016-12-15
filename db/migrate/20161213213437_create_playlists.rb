class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :username
      t.string :playlist_id

      t.timestamps
    end
  end
end
