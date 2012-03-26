class CreateContestMovies < ActiveRecord::Migration

  def up
    create_table :refinery_contest_movies do |t|
      t.string :name
      t.text :anotation
      t.string :year
      t.string :director_name
      t.string :director_surname
      t.integer :director_year
      t.string :screenwriter_name
      t.string :screenwriter_surname
      t.integer :screenwriter_year
      t.integer :category_id
      t.string :genre
      t.text :actors
      t.text :informations
      t.string :youtube_link
      t.string :surname
      t.text :address
      t.string :telephone
      t.string :email
      t.integer :position
      t.boolean :approved

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-contest"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/contest/movies"})
    end

    drop_table :refinery_contest_movies

  end

end
