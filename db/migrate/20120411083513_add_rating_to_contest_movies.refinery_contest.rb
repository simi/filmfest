# This migration comes from refinery_contest (originally 3)
class AddRatingToContestMovies< ActiveRecord::Migration
  def change
    add_column :refinery_contest_movies, :judge_text_rating, :string
    add_column :refinery_contest_movies, :judge_rating, :float
    add_column :refinery_contest_movies, :age_category, :string

  end
end
