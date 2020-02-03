Rails.application.routes.draw do
  # post 'import/read' => 'importer#import_file'
  post 'import' => 'importer#create_file'
  resources :courses
  resources :lessons
  post 'flash_cards/index' => "flash_cards#index"
  resources :flash_cards
  post 'card_translations/index' => "card_translations#index"
  resources :card_translations
  resources :levels
  resources :languages
end

# localhost:3000/lessons?course_id=3
#localhost:3000/lessons
# get 'import' => 'importer#import'