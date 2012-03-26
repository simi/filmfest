Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :contest, :path => '' do
    resources :movies, :only => [:create, :index, :show], :path => 'soutezni-filmy'
  end

  # Admin routes
  namespace :contest, :path => '' do
    namespace :admin, :path => 'refinery/contest' do
      resources :movies, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
