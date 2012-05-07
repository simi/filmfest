# encoding: UTF-8
class SexyMailer < ActionMailer::Base
  default from: "info@karlinfilmfest.cz"

  def new_movie(movie)
    @movie = movie
    mail to: Refinery::Setting.get(:email), subject: 'Nový film na karlinfilmfest.cz'
  end

  def thanks(movie)
    @movie = movie
    mail to: movie.email, subject: 'Děkujeme za přidání filmu na karlinfilmfest.cz'
  end
end
