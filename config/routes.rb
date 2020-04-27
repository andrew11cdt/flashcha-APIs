Rails.application.routes.draw do
  # post 'import/read' => 'importer#import_file'
  post 'import' => 'importer#create_file'
  resources :courses
  resources :lessons
  post 'flash_cards/index' => "flash_cards#index"
  post 'flash_cards/array_create' => "flash_cards#array_create"
  resources :flash_cards
  post 'card_translations/index' => "card_translations#index"
  post 'card_translations/array_create' => "card_translations#array_create"
  resources :card_translations
  resources :levels
  resources :languages
end
# Ahhihi
# localhost:3000/lessons?course_id=3
#localhost:3000/lessons
# get 'import' => 'importer#import'