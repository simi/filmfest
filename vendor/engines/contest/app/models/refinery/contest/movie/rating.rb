# encoding: utf-8
module Refinery
  module Contest
    class Movie::Rating < Refinery::Core::BaseModel
      belongs_to :movie, :class_name => '::Refinery::Contest::Movie'

      validates :name, :presence => true
      validates :value, :presence => true
      validates :ip, :presence => true
      validates :movie_id, :presence => true

      after_create :update_movie_rating

      private
      def update_movie_rating
        self.movie.update_rating!
      end
    end
  end
end
