class AddImageToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :image, :string
  end
end
