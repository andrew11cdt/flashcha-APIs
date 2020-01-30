Rails.application.routes.draw do
  post 'import/read' => 'importer#import_file'
  post 'import/create' => 'importer#create_file'
  resources :courses
  resources :lessons
  resources :flash_cards
  resources :card_translations
  resources :levels
  resources :languages
end

# localhost:3000/lessons?course_id=3
#localhost:3000/lessons
# get 'import' => 'importer#import'