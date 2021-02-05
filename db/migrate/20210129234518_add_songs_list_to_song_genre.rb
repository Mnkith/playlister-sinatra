class AddSongsListToSongGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :song_genres
  end
end
