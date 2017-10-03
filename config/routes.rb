WebPi::Application.routes.draw do
  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :band_photos, except: [:index, :show]
  resources :bio_entries, except: [:show]
  resources :concerts,    except: [:show]
  resources :entries,     except: [:show]
  resources :home,        only:   [:index]
  resources :members,     except: [:index, :show]
  # resources :orders,      only:   [:new, :create]
  resources :shop_items,  except: [:index, :show]
  resources :slides,      except: [:show]
  resources :tags,        only:   [:show]

  resources :records do
    resources :songs, only: [:new, :create, :update]
  end
  resources :songs, only: [:edit, :destroy]

  resources :photo_categories do
    resources :images, only: [:new, :create, :update]
  end
  resources :images, only: [:edit, :destroy]

  resources :video_categories do
    resources :videos, only: [:new, :create, :update]
  end
  resources :videos, only: [:show, :edit, :destroy]

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"
  get 'concerts/last', :to => 'concerts#last'
end
