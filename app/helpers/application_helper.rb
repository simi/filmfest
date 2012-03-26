module ApplicationHelper
  include FlashBlockHelper
  def reset_movie_session
    session[:movie] = nil
  end
end
