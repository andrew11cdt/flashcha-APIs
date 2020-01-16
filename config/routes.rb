Rails.application.routes.draw do
  get 'import' => 'flash_cards#import'
  resources :courses
  resources :lessons
  resources :flash_cards
  resources :card_translations
  resources :levels
  resources :languages
end

# localhost:3000/lessons?course_id=3
#localhost:3000/lessons