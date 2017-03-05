class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.belongs_to :user, foreign_key: true
      t.string :movie_id
      t.string :movie_title
      t.string :movie_poster
      t.string :movie_year
      t.string :movie_plot
      t.string :movie_runtime
      t.string :movie_genre
      t.string :movie_metascore
      t.string :movie_imdbRating

      t.timestamps
    end
  end
end
