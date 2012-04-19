# This migration comes from refinery_contest (originally 4)
class CreateContestMovieRating < ActiveRecord::Migration
  def change
    create_table :refinery_contest_movie_ratings do |t|
      t.integer :movie_id
      t.integer :value
      t.string  :name
      t.string  :ip

      t.timestamps
    end
  end
end
