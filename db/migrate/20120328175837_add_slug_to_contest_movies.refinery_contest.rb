# This migration comes from refinery_contest (originally 2)
class AddSlugToContestMovies < ActiveRecord::Migration
  def change
    add_column :refinery_contest_movies, :slug, :string
  end
end
