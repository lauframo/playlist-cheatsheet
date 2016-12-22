class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string, :name
      t.string, :summary
      t.integer, :artist_id
      t.integer :album_id

      t.timestamps
    end
  end
end
