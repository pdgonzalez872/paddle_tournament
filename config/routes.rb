Rails.application.routes.draw do

  root "static_pages#index"

  resources :static_pages

  resources :tournaments do
    resources :draws do
      resources :matches
      resources :draw_positions
    end
  end

  resources :locations
  resources :players
end
