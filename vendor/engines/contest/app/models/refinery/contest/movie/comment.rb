# encoding: utf-8
module Refinery
  module Contest
    class Movie::Comment < Refinery::Core::BaseModel
      belongs_to :movie, :class_name => '::Refinery::Contest::Movie'

      validates :name, :presence => true
      validates :text, :presence => true
      validates :ip, :presence => true
      validates :movie_id, :presence => true
    end
  end
end
