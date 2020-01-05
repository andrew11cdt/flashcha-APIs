Rails.application.routes.draw do
  resources :courses do
    resources :lessons do
      resources :flash_cards
    end
  end
end
