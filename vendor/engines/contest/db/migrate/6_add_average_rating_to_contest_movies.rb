class AddAverageRatingToContestMovies < ActiveRecord::Migration
  def change
    add_column :refinery_contest_movies, :average_rating, :float, :default => 0
  end
end
