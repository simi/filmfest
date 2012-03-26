# encoding: utf-8
module Refinery
  module Contest
    class Movie < Refinery::Core::BaseModel
      acts_as_indexed :fields => [:name, :anotation, :year, :director_name, :director_surname, :screenwriter_name, :screenwriter_surname, :genre, :actors, :informations, :youtube_link, :name, :surname, :address, :telephone, :email]
      belongs_to :category, :class_name => ::Category

      scope :approved, where(:approved => true)

      validates_uniqueness_of :name, :message => 'film s tímto názvem již soutěží'
      ["name", "anotation", "year", "director_name", "director_surname",
        "director_year", "screenwriter_name", "screenwriter_surname",
        "screenwriter_year", "category_id", "genre", "actors",
        "informations", "youtube_link", "surname", "address",
        "telephone", "email"].each do |column|
        validates_presence_of column.to_sym, :message => 'prosím vyplňte'
      end

      def director
        [director_name, director_surname].join(' ')
      end

      def age_category
        (director_year > 1994) ? "7-18" : "19-26"
      end

      def judge_rating
        0
      end

      def public_rating
        0
      end
    end
  end
end
