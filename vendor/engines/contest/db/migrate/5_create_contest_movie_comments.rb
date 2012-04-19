class CreateContestMovieComments < ActiveRecord::Migration
  def change
    create_table :refinery_contest_movie_comments do |t|
      t.integer :movie_id
      t.string :name
      t.text :text
      t.string  :ip

      t.timestamps
    end
  end
end
