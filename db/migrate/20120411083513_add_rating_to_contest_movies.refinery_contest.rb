# This migration comes from refinery_contest (originally 3)
class AddRatingToContestMovies< ActiveRecord::Migration
  def change
    add_column :refinery_contest_movies, :judge_text_rating, :string
    add_column :refinery_contest_movies, :judge_rating, :decimal, :default => 0, :precision => 2, :scale => 1
    add_column :refinery_contest_movies, :age_category, :string

  end
end
