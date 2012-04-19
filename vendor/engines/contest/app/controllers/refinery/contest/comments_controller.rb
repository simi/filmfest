#encoding: UTF-8
module Refinery
  module Contest
    class CommentsController < ::ApplicationController
      def create
        @comment = Refinery::Contest::Movie::Comment.new(params[:movie_comment])
        @comment.ip = request.remote_ip
        @comment.save!
        redirect_to :back, :notice => 'Komentář přidán'
      end
    end
  end
end
