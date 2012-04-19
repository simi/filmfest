#encoding: UTF-8
module Refinery
  module Contest
    class RatingsController < ::ApplicationController
      def create
        @rating = Refinery::Contest::Movie::Rating.new(params[:movie_rating])
        @rating.ip = request.remote_ip
        @rating.save!
        redirect_to :back, :notice => 'Hodnocení přidáno'
      end
    end
  end
end
