Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :contest, :path => '' do
    resource :comments, :only => [:create, :destroy]
    resource :ratings, :only => [:create]
    resources :movies, :only => [:create, :index, :show], :path => 'soutezni-filmy' do
    end
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
