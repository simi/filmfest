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

      def destroy
        raise 'NotLogged' unless refinery_user?
        @comment = Refinery::Contest::Movie::Comment.find(params[:id])
        @comment.destroy
        redirect_to :back, :alert => 'Komentář smazán'
      end
    end
  end
end
