#encoding: UTF-8
module Refinery
  module Contest
    class MoviesController < ::ApplicationController

      before_filter :find_all_movies, :except => :create
      before_filter :find_page, :except => :create

      def create
        @movie = ::Refinery::Contest::Movie.new(params[:movie])
        if @movie.save
          redirect_to(:back, :notice => 'Film byl poslán ke kontrole.')
        else
          session[:movie] = @movie
          redirect_to(:back)
        end
      end

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @movie in the line below:
        present(@page)
      end

      def show
        @movie = Movie.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @movie in the line below:
        present(@page)
      end

    protected

      def find_all_movies
        @search = Movie.search(params[:q])
        @movies = @search.result.approved.order('position ASC').paginate(:page => params[:page], :per_page => 10)
      end

      def find_page
        #@page = Refinery::Page.by_title("Soutěžní filmy")
      end

    private
    def guest_can_comment?
      @movie.comments.where(:ip => request.ip).empty?
    end

    def guest_can_rate?
      @movie.ratings.where(:ip => request.ip).empty?
    end

    helper_method :guest_can_rate?, :guest_can_comment?
    end
  end
end
