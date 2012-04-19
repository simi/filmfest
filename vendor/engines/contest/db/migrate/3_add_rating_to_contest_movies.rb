class AddRatingToContestMovies< ActiveRecord::Migration
  def change
    add_column :refinery_contest_movies, :judge_text_rating, :string
    add_column :refinery_contest_movies, :judge_rating, :decimal, :default => 0
  end
end
