Rails.application.routes.draw do
  resources :courses
  resources :lessons
  # get 'lessons/:dung' => 'lessons#show'
  resources :flash_cards
  resources :levels
  resources :languages
end

# localhost:3000/lessons?course_id=3
#localhost:3000/lessons