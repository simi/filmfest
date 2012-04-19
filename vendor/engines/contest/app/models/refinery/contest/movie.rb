# encoding: utf-8
module Refinery
  module Contest
    class Movie < Refinery::Core::BaseModel
      extend FriendlyId

      friendly_id :name, use: :slugged
      acts_as_indexed :fields => [:name, :anotation, :year, :director_name, :director_surname, :screenwriter_name, :screenwriter_surname, :genre, :actors, :informations, :youtube_link, :name, :surname, :address, :telephone, :email]
      belongs_to :category, :class_name => ::Category

      before_save :save_age_category
      scope :approved, where(:approved => true)

      validates_uniqueness_of :name, :message => 'film s tímto názvem již soutěží'
      validates_format_of :youtube_link,
        :with => /http:\/\/www.youtube.com\/watch\?v=(.*)/,
        :message => 'Prosím zadejte youtube link ve tvaru "http://www.youtube.com/watch?v=5pr4Ugdg-9k"'
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

      def screenwriter
        [screenwriter_name, screenwriter_surname].join(' ')
      end

      def save_age_category
        self.age_category = (director_year > 1994) ? "7-18" : "19-26"
      end

      def judge_rating
        0
      end

      def public_rating
        0
      end

      def youtube_embed
        link = youtube_link.scan(/http:\/\/www.youtube.com\/watch\?v=(.*)/).flatten.first
        "<iframe width=\"770\" height=\"400\" src=\"http://www.youtube.com/embed/#{link}\" frameborder=\"0\" allowfullscreen></iframe>".html_safe
      end

      def rated?
      end
    end
  end
end
