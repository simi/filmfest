class AddSlugToContestMovies < ActiveRecord::Migration
  def change
    add_column :refinery_contest_movies, :slug, :string
  end
end
